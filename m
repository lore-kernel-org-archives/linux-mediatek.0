From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Staging: mt7621-mmc: Cleanup in msdc_app_cmd()
Date: Sat, 20 Apr 2019 23:02:48 +0200
Message-ID: <20190420210248.GA25911@kroah.com>
References: <20190419211130.25284-1-madhumithabiw@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20190419211130.25284-1-madhumithabiw@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Madhumitha Prabakaran <madhumithabiw@gmail.com>
Cc: matthias.bgg@gmail.com, devel@driverdev.osuosl.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Apr 19, 2019 at 04:11:30PM -0500, Madhumitha Prabakaran wrote:
> Remove unwanted variable and replace the respective return type.
> 
> Issue suggested by Coccinelle.
> 
> Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
> ---
>  drivers/staging/mt7621-mmc/sd.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

This file is long deleted.  Always make sure you work off of the latest
development tree for the subsystem you are wanting to contribute to.  Or
on linux-next at the least.

thanks,

greg k-h
