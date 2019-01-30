From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] staging: mt7621-eth/ethtool.c: Correction of SPDX license
 identifier
Date: Wed, 30 Jan 2019 09:48:58 +0100
Message-ID: <9acb57b8-1210-672e-aced-17af4c06305a@gmail.com>
References: <SC1P15201MB2014021EF99A3FB8ACF92515A8900@SC1P15201MB2014.LAMP152.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <SC1P15201MB2014021EF99A3FB8ACF92515A8900-n6uN9oJn7pUGE5ncnRwwVnXZKBRSm5aV/Ujsoj3cBu5BGWnSfhEsfQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Carlos Henrique Lima Melara <charlesmelara-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org" <neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 30/01/2019 06:53, Carlos Henrique Lima Melara wrote:
> 	This patch fix the checkpatch.p1 warning:
> 
> 	WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> 	+/*
> 
> 	It includes the SPDX expression for GPL-2.0 and corrects the comment format to suit the kernel's coding style.

Patch description should be aligned to the left.

Regards,
Matthias

> 
> Signed-off-by: Carlos (Charles) Henrique Lima Melara <charlesmelara-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/staging/mt7621-eth/ethtool.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-eth/ethtool.c b/drivers/staging/mt7621-eth/ethtool.c
> index 40a7d47be913..49d417de64c8 100644
> --- a/drivers/staging/mt7621-eth/ethtool.c
> +++ b/drivers/staging/mt7621-eth/ethtool.c
> @@ -1,15 +1,17 @@
> -/*   This program is free software; you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; version 2 of the License
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License
>   *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *   GNU General Public License for more details.
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
>   *
> - *   Copyright (C) 2009-2016 John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> - *   Copyright (C) 2009-2016 Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> - *   Copyright (C) 2013-2016 Michael Lee <igvtee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + * Copyright (C) 2009-2016 John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> + * Copyright (C) 2009-2016 Felix Fietkau <nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> + * Copyright (C) 2013-2016 Michael Lee <igvtee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>   */
>  
>  #include "mtk_eth_soc.h"
> 
