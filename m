From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Thu, 14 Mar 2019 14:24:11 +0100
Message-ID: <ae1cea3e-9790-1ce0-a43a-5cfe588a2fd6@denx.de>
References: <20190313122403.248873-1-armax@google.com>
 <20190313123454.GB2202@kadam> <20190314111313.GB8034@google.com>
 <f620e4ef-3d9e-4230-30e8-5cc608710695@denx.de>
 <CAOcbMd3tfFiVjvPE+mvCjP22-a6oY2LJRig05PJPRAL4DvpCMA@mail.gmail.com>
 <96fb1765-971b-2329-bccd-88e0517f6f23@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96fb1765-971b-2329-bccd-88e0517f6f23@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Armando Miraglia <arma2ff0@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Neil Brown <neil@brown.name>, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sankalp Negi <sankalpnegi2310@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On 14.03.19 14:14, Matthias Brugger wrote:
> 
> 
> On 14/03/2019 12:37, Armando Miraglia wrote:
>> Absolutely!
> 
> Please don't top post :)
> 
>>
>> Cheers,
>> A.
>>
>> On Thu, Mar 14, 2019 at 12:36 PM Stefan Roese <sr@denx.de> wrote:
> [...]
>>>
>>> Would it be possible for you to wait a bit with this minor cleanup?
>>> As I'm preparing a patch to move this driver out of staging right
>>> now. You can definitely follow-up with your cleanup, once this move
>>> is done. Otherwise the move might be delayed even more.
>>>
> 
> Hm but shouldn't style issues be a criteria for not accepting a move out of
> staging?

I would agree, if those style issues where non trivial. In the end we
are talking about one non-optimal identation now.

> I think so. You could add Armandos patch in your series or rebase your
> series against Greg's tree, once he took the clean-up. Normally Greg is
> incredibly fast :)

I should have included the history here to make this more clean. I've
started pulling this driver out of staging a few weeks ago:

https://patchwork.kernel.org/patch/10790537/
...

Here you find Greg's comment, that the style patches should be merged
first before the move out of staging. This is what I worked on after
this first patch series:

https://patchwork.kernel.org/patch/10792455/
...

Now these 9 style issue patches from me have been merged and I would
like to proceed with the driver move.

Thanks,
Stefan
