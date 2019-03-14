From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] spi: mediatek: Attempt to address style issues in
 spi-mt7621.c
Date: Thu, 14 Mar 2019 13:50:48 -0700
Message-ID: <dc871c3e4eb911220e7b079a25ea449413749b09.camel@perches.com>
References: <20190313122403.248873-1-armax@google.com>
         <20190313123454.GB2202@kadam> <20190314111313.GB8034@google.com>
         <20190314112732.GJ2227@kadam> <20190314150737.61eed622@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314150737.61eed622@endymion>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Armando Miraglia <arma2ff0@gmail.com>, neil@brown.name, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, sankalpnegi2310@gmail.com, matthias.bgg@gmail.com, sr@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-03-14 at 15:07 +0100, Jean Delvare wrote:
> My principle is that if a script
> is present in the kernel tree then it can and should be maintained. If
> it is deemed not worth the maintenance effort then it should be
> deleted.

I've suggested deleting Lindent in the past.
https://lkml.org/lkml/2013/2/11/390

Also there is now the clang-format tool that
does an OK job of reflowing source to something
approximating the typical kernel style.

See:  Documentation/process/clang-format.rst
