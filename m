From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: mt7621-pci: Fix checkpatch errors
Date: Wed, 12 Dec 2018 11:33:47 +0100
Message-ID: <20181212103347.GA16458@kroah.com>
References: <CALT5DkvTHn=TO5TDd+_qiNobkukdQ=M1zhRatOHD3QCbBkes4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALT5DkvTHn=TO5TDd+_qiNobkukdQ=M1zhRatOHD3QCbBkes4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yuhui zhang <zhangyuhui89757@gmail.com>
Cc: matthias.bgg@gmail.com, sergio.paracuellos@gmail.com, neil@brown.name, mamtashukla555@gmail.com, peter.vernia@gmail.com, blogic@openwrt.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Dec 10, 2018 at 03:23:06PM +0800, yuhui zhang wrote:
> This patch fixes the following checkpatch.pl errors in the
> drivers/staging/mt7621-pci:
> ERROR: space required after that ')'.
> ERROR: space required after that '='.
> 
> Signed-off-by: zhangyuhui <zhangyuhui89757@gmail.com>
> ---
>  drivers/staging/mt7621-pci/pci-mt7621.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

You sent this same patch 4 times.  Or at least I think it is the same
patch, I really do not know...

Please resend, properly, to the correct mailing lists and people, this
patch only one time.

Also, you need to fix up your from: and signed-off-by lines to match up.

thanks,

greg k-h
