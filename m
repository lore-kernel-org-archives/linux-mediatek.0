From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Thu, 14 Mar 2019 14:14:34 +0100
Message-ID: <96fb1765-971b-2329-bccd-88e0517f6f23@gmail.com>
References: <20190313122403.248873-1-armax@google.com>
 <20190313123454.GB2202@kadam> <20190314111313.GB8034@google.com>
 <f620e4ef-3d9e-4230-30e8-5cc608710695@denx.de>
 <CAOcbMd3tfFiVjvPE+mvCjP22-a6oY2LJRig05PJPRAL4DvpCMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAOcbMd3tfFiVjvPE+mvCjP22-a6oY2LJRig05PJPRAL4DvpCMA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Armando Miraglia <arma2ff0@gmail.com>, Stefan Roese <sr@denx.de>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Sankalp Negi <sankalpnegi2310@gmail.com>, Neil Brown <neil@brown.name>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-mediatek@lists.infradead.org



On 14/03/2019 12:37, Armando Miraglia wrote:
> Absolutely!

Please don't top post :)

> 
> Cheers,
> A.
> 
> On Thu, Mar 14, 2019 at 12:36 PM Stefan Roese <sr@denx.de> wrote:
[...]
>>
>> Would it be possible for you to wait a bit with this minor cleanup?
>> As I'm preparing a patch to move this driver out of staging right
>> now. You can definitely follow-up with your cleanup, once this move
>> is done. Otherwise the move might be delayed even more.
>>

Hm but shouldn't style issues be a criteria for not accepting a move out of
staging? I think so. You could add Armandos patch in your series or rebase your
series against Greg's tree, once he took the clean-up. Normally Greg is
incredibly fast :)

Regards,
Matthias
