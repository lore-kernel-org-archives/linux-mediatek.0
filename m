From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: xhci-mtk: fixup mouse wakeup failure during system suspend
Date: Tue, 03 May 2016 10:51:53 +0300
Message-ID: <87vb2vfujq.fsf@intel.com>
References: <1461204293-18243-1-git-send-email-chunfeng.yun@mediatek.com> <1462261458.11651.7.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462261458.11651.7.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: chunfeng yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

chunfeng yun <chunfeng.yun@mediatek.com> writes:
> On Thu, 2016-04-21 at 10:04 +0800, Chunfeng Yun wrote:
>> Click mouse after xhci suspend completion but before system suspend
>> completion, system will not be waken up by mouse if the duration of
>> them is larger than 20ms which is the device UFP's resume signaling

what is "them" here ? The duration of what is longer than 20ms ?

>> lasted. Another reason is that the SPM is not enabled before system

what's SPM ?

>> suspend compeltion, this causes SPM also not notice the resume signal.
           ^^^^^^^^^^
           completion

>> So in order to reduce the duration less than 20ms, make use of
>> syscore's suspend/resume interface.

no, this is the wrong approach

>> In fact it is a work around solution which only reduces the
>> probability of failure, because we can't ensure that the duration from
>> syscore's suspend completion to SPM working is always less than 20ms.

right, which means you're not really fixing anything. Morevoer, you make
it so that this won't work with multiple instances of the XHCI IP in
your SoC.

>> Because the syscore runs on irq disabled context, and xhci's
>> suspend/resume calls some sleeping functions, enable local irq
>> and then disable it during suspend/resume. This may be not a problem,
>> since only boot CPU is runing.

another problem :) calling local_irq_{enable,disable}() is an indication
that something's wrong.

>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>>  drivers/usb/host/xhci-mtk.c |   31 ++++++++++++++++++++++++++++++-
>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
>> index 79959f1..8277f02 100644
>> --- a/drivers/usb/host/xhci-mtk.c
>> +++ b/drivers/usb/host/xhci-mtk.c
>> @@ -28,6 +28,7 @@
>>  #include <linux/pm_runtime.h>
>>  #include <linux/regmap.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/syscore_ops.h>
>>=20=20
>>  #include "xhci.h"
>>  #include "xhci-mtk.h"
>> @@ -490,6 +491,8 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
>>  	return xhci_gen_setup(hcd, xhci_mtk_quirks);
>>  }
>>=20=20
>> +static struct device *xhci_mtk_syscore_dev;

now, what happens when you have more than one XHCI instance ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXKFiZAAoJEIaOsuA1yqRExxYP/3BUIL3rCxYEbIeDCJBFDtXG
lOg9u4vQNCTHWnF0OQ+yAgVrUnMbRIQd6b+zNxVwGFnF8I6f+a3HX7AZCMRa3/2i
UF1dZWpWChWU6pkGC19UF0w3y51s/DL03BNfNmdu/l/nWMCsFa1ZsrpIIuehqHQ6
+wc0aOFyFPWs0RH0cXiooA4LaVdNhQ1iKmHjhtd8zcqKBK1DFjOmZExVs0wOvuhA
VgbFi1DamO2chyYe87Mkgqsr89pBIi95WaHbyYwOoEBnUl+jzvqanDsx2U6CwmX7
32AUieeg4PdSKPoA3zCZqWuOVI1bGx5l9N+Q2HcxP9x/onzdBP/MgGufKQ6u/gM5
PSKahUzubegU6pZwyEBBIsMO6rOst4a1H9+exs3uEb9B13RT8TbcHhBmTxCC5hNJ
YjsTJFG5sUb/MJy8AktFar03WT5xuYEW1nvW54PH5zZsLhL854NxG97YvI1tSJOp
YbYYHEbzffkBdLeN7l62FKY4x7IqPIAGjeK3dIztOAU0pv5OfQkWp/HTaPXRpYEu
l3L1+8ZFa9rZC4V27Qk5su2CkVCAmINq16wsF6VZ9Gh7Jgjrn27nxighgYyzVAhf
jgMM/PMbAFmcWUoyYsKkbUm5Ydlf9A3clAda9qRt1lmnDfc/WhwyQByoqL8geKnY
CxI77D0y+OIMYIZZ5mEO
=QKA2
-----END PGP SIGNATURE-----
--=-=-=--
