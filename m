From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] staging, mt7621-eth: fix api for linkmode bitmap
Date: Mon, 18 Mar 2019 07:58:46 +0100
Message-ID: <20190318065846.GA15948@kroah.com>
References: <20190309095400.26930-1-mussitantesmortem@gmail.com>
 <20190309095400.26930-2-mussitantesmortem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190309095400.26930-2-mussitantesmortem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxim Zhukov <mussitantesmortem@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Mar 09, 2019 at 12:53:59PM +0300, Maxim Zhukov wrote:
> Start using new api for linkmode bitmap
> 
> Fixed build after 3c1bcc8614db ("net: ethernet: Convert phydev advertize and supported from u32 to link mode")
> 
> Signed-off-by: Maxim Zhukov <mussitantesmortem@gmail.com>
> ---
>  drivers/staging/mt7621-eth/mdio.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

This driver is now dropped from the tree, so no need to fix any build
issues :)

thanks,

greg k-h
