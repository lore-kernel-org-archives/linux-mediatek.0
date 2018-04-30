From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Mon, 30 Apr 2018 18:12:40 +0200
Message-ID: <CAKfDRXiYdxSusSSZ5rC38quM+vk+n1mKdmpedDvPG1sNZSd=wA@mail.gmail.com>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
 <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
 <fc2bf32a-eb81-6cd1-9085-b8786ddf0f9c@phrozen.org>
 <CAKfDRXjpG4CNeHfKC1Kg=6mrqUTZ8A7bD1aivLkSQ2L0eK755Q@mail.gmail.com>
 <6ae4103b-45bf-c427-d0d9-87f6f4eb83b5@phrozen.org>
 <CAKfDRXiJCMpA+qj4HmoSg0F_Yt4LnjQ=Dvy_tkxa=Dnh_pN13g@mail.gmail.com>
 <a594ffaa-4098-4171-f824-1aa3f332c9fc@gmail.com>
 <CAKfDRXgNGRHu9JMs-9vb4n72w+PmR8buqDnz8ObEQNXtP1pM4w@mail.gmail.com>
 <1518446229.9025.61.camel@mtkswgap22>
 <CAKfDRXi57H5V+Qv-YO6+8OKdZLbTw7T_h64uZTMQZP6biO7Wpg@mail.gmail.com>
 <CAKfDRXg419rBTeqZ+UqQJFRj5s6CVg0YXzjmhyFxrbJgMkM8fg@mail.gmail.com>
 <1525052532.5013.5.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000008aa7ec056b131f96"
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1525052532.5013.5.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

--0000000000008aa7ec056b131f96
Content-Type: text/plain; charset="UTF-8"

Hi Ryder,

On Mon, Apr 30, 2018 at 3:42 AM, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> We didn't support port2 (pcie@2,0) for mainline version, but if you want
> to use it you could take a look at -
> https://patchwork.kernel.org/patch/9747713/
>
> grep: HIF_SYSCFG1 /HIF_SYSCFG1_PHY2_MASK
>
> That is, you need to clear these bits to 0 to enable PHY for pcie@2,0.

Thanks a lot for the pointer. With the attached patch and a slight
update to my DTS (add a reference to hifsys for usb3phy2), both the
PCIe-slots work and I have both 2.4Ghz and 5GHz.

The "only" thing left now is the USB OTG-port. I got the SDK from the
vendor yesterday, but without any proper documentation. Looking
through the kernel configuration for my board, the only relevant
select options (that I could find), was that USB_MUSB_HDRC and
MUSB_PIO_ONLY was enabled. Enabling those options for my 4.14 kernel
has seemingly no effect, the modem connected to PCIe-slot connected to
the OTG-port (puh) is not visible. Does anyone know where I should
start looking in order to enable this port? I see that there is some
mention of OTG in phy-mtk-tphy.c, but not sure if that is relevant.
Also, as far as I can tell, my device should be set to host mode and
both usb-phys are activated (phy1 is the port on the front of my
board, phy2 shared with pcie).

Thanks in advance for any help (again)!

BR,
Kristian

--0000000000008aa7ec056b131f96
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-Add-hifsys-support-to-phy-mtk-tphy.patch"
Content-Disposition: attachment;
	filename="0001-Add-hifsys-support-to-phy-mtk-tphy.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jgme3ppt0

RnJvbSA0ZDA1NGZhMWY3MmM2NWU5NjQwYjNkZDFhOTBjMmVjYjZkZDU3NDQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLcmlzdGlhbiBFdmVuc2VuIDxrcmlzdGlhbi5ldmVuc2VuQGdt
YWlsLmNvbT4KRGF0ZTogTW9uLCAzMCBBcHIgMjAxOCAxNDozODowMSArMDIwMApTdWJqZWN0OiBb
UEFUQ0hdIEFkZCBoaWZzeXMtc3VwcG9ydCB0byBwaHktbXRrLXRwaHkKCi0tLQogZHJpdmVycy9w
aHkvbWVkaWF0ZWsvcGh5LW10ay10cGh5LmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLXRwaHkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstdHBo
eS5jCmluZGV4IDcyMWEyYTFjOS4uMGNiMWNlYTUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLXRwaHkuYworKysgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRr
LXRwaHkuYwpAQCAtMjIsNiArMjIsOCBAQAogI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4K
ICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+CisjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPgorI2luY2x1ZGUgPGxpbnV4L3Jl
Z21hcC5oPgogCiAvKiB2ZXJzaW9uIFYxIHN1Yi1iYW5rcyBvZmZzZXQgYmFzZSBhZGRyZXNzICov
CiAvKiBiYW5rcyBzaGFyZWQgYnkgbXVsdGlwbGUgcGh5cyAqLwpAQCAtMjU5LDYgKzI2MSw5IEBA
CiAjZGVmaW5lIFJHX0NEUl9CSVJMVEQwX0dFTjNfTVNLCQlHRU5NQVNLKDQsIDApCiAjZGVmaW5l
IFJHX0NEUl9CSVJMVEQwX0dFTjNfVkFMKHgpCSgweDFmICYgKHgpKQogCisjZGVmaW5lIEhJRl9T
WVNDRkcxCQkJMHgxNAorI2RlZmluZSBISUZfU1lTQ0ZHMV9QSFkyX01BU0sJCSgweDMgPDwgMjAp
CisKIGVudW0gbXRrX3BoeV92ZXJzaW9uIHsKIAlNVEtfUEhZX1YxID0gMSwKIAlNVEtfUEhZX1Yy
LApAQCAtMzAyLDYgKzMwNyw3IEBAIHN0cnVjdCBtdGtfdHBoeSB7CiAJc3RydWN0IGNsayAqdTNw
aHlhX3JlZjsJLyogcmVmZXJlbmNlIGNsb2NrIG9mIHVzYjMgYW5vbG9nIHBoeSAqLwogCWNvbnN0
IHN0cnVjdCBtdGtfcGh5X3BkYXRhICpwZGF0YTsKIAlzdHJ1Y3QgbXRrX3BoeV9pbnN0YW5jZSAq
KnBoeXM7CisJc3RydWN0IHJlZ21hcCAqaGlmOwogCWludCBucGh5czsKIH07CiAKQEAgLTU5NCw2
ICs2MDAsMTAgQEAgc3RhdGljIHZvaWQgcGNpZV9waHlfaW5zdGFuY2VfaW5pdChzdHJ1Y3QgbXRr
X3RwaHkgKnRwaHksCiAJaWYgKHRwaHktPnBkYXRhLT52ZXJzaW9uICE9IE1US19QSFlfVjEpCiAJ
CXJldHVybjsKIAorCWlmICh0cGh5LT5oaWYpCisJCXJlZ21hcF91cGRhdGVfYml0cyh0cGh5LT5o
aWYsIEhJRl9TWVNDRkcxLAorCQkJCSAgIEhJRl9TWVNDRkcxX1BIWTJfTUFTSywgMCk7CisKIAl0
bXAgPSByZWFkbCh1M19iYW5rcy0+cGh5YSArIFUzUF9VM19QSFlBX0RBX1JFRzApOwogCXRtcCAm
PSB+KFAzQV9SR19YVEFMX0VYVF9QRTFIIHwgUDNBX1JHX1hUQUxfRVhUX1BFMkgpOwogCXRtcCB8
PSBQM0FfUkdfWFRBTF9FWFRfUEUxSF9WQUwoMHgyKSB8IFAzQV9SR19YVEFMX0VYVF9QRTJIX1ZB
TCgweDIpOwpAQCAtMTAwOCw2ICsxMDE4LDE2IEBAIHN0YXRpYyBpbnQgbXRrX3RwaHlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJdHBoeS0+dTNwaHlhX3JlZiA9IE5VTEw7
CiAJfQogCisJaWYgKG9mX2ZpbmRfcHJvcGVydHkobnAsICJtZWRpYXRlayxwaHktc3dpdGNoIiwg
TlVMTCkpIHsKKwkJdHBoeS0+aGlmID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShu
cCwKKwkJCQkJCQkgICAgIm1lZGlhdGVrLHBoeS1zd2l0Y2giKTsKKwkJaWYgKElTX0VSUih0cGh5
LT5oaWYpKSB7CisJCQlkZXZfZXJyKCZwZGV2LT5kZXYsCisJCQkJIm1pc3NpbmcgXCJtZWRpYXRl
ayxwaHktc3dpdGNoXCIgcGhhbmRsZVxuIik7CisJCQlyZXR1cm4gUFRSX0VSUih0cGh5LT5oaWYp
OworCQl9CisJfQorCiAJcG9ydCA9IDA7CiAJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShucCwgY2hp
bGRfbnApIHsKIAkJc3RydWN0IG10a19waHlfaW5zdGFuY2UgKmluc3RhbmNlOwotLSAKMi4xNC4x
Cgo=
--0000000000008aa7ec056b131f96
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--0000000000008aa7ec056b131f96--
