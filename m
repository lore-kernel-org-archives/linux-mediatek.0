Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498BED3E18D
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=; b=ynHaIFQawbhlPSRLi5lpnbEP5Y
	Ofz11EzJvyzZjZE120e/nR+WUEhp3hFFZ4uRX9LWqk99RpYc0nqQx4uSO4BI0aoq2pqgZr2Sw6f2S
	Cuqv1lijGPhYW2QUCnqyMgCOmqxlfyEnJzRwtzN1Gcw5WvIoY7HHrqkucuL03I9+kJiQ5SlevVgDC
	vaj3KEQGnZlm1GsWxCYBKDtHoGOzz9np6EJTlYAAgyLULRz11eBHYSZ7VdKs2upgs/5MOAC3OryW9
	K5HZnm1SrWPXiYRJKnfTXinYNt+sL7K/1RvjH+DE56qkaVD9W8LXTsZBQ35ZMDCsdNQ5e+jQ5pQT+
	rXwS86Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mjJ-00000006Lq1-0hjU;
	Mon, 21 Oct 2024 07:21:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mdE-00000006KKT-0sVO;
	Mon, 21 Oct 2024 07:15:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c9978a221so47573025ad.1;
        Mon, 21 Oct 2024 00:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729494908; x=1730099708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=;
        b=iBb3diZRT0ZuQcS7bsxYy1NmdtaLH3UZlz6Yj3Ntv+7rouQUKChAbxuj86IeNgYPkl
         vu0uQOBe6Vp/b6PNDyp+2O1hJniudGBFabf2SPZ7p4gPY6g+XMgnu+4BBK4ZrvgQqOcb
         5SI9eFMPuG9te1rt3VlRUF/ZUXORkbtsDQxK6PIyol5IMEh3dPtH5L+uZ+4VIe4iLhDt
         btd8ns0z5dMGqckLv3UT7LP0TIXLQoPiPZa/vzAZKmemANyeX2hPJkN7x2NrT2gYoAXh
         HFC7d+xqXssPCZMlbwyXlDlpOTWG6r8EWpWn5AVUXiRTnaCr59w9rrYlLCnCbgNbhFaL
         SE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729494908; x=1730099708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=;
        b=JOh9mCSg1Ag6XVESgRJCJzS0ioYTY9xXCG3iLwo5JawgcM656UEWPku7JFvl6zF4QZ
         lJ9++3VWI/PFJVjDeSQhVv49pcboXyj4/XWWljm1gFCVvp2xtuVhEWyFwTKg477Zicte
         hkpB9m1HVNctXT2WjX4wxil7UwMcsmQ2FqDLt54+4d0hoh0IzdmVZYFSu9BRSxcOx91c
         yLdiaHx5joVNEWsAN/xDdCmZN/YmhiY770NBmwzGeXqRLqbvClrpPzTQ0Xc0VK1ZYiHf
         gu5P5LjRyF0KG16UUfxiB4FZWZZ9pjLToobn6QOjjFnxOePC/hDXYkE2157EieGrQ7rq
         VF3w==
X-Forwarded-Encrypted: i=1; AJvYcCXWQGmVMEQEsNoc0uxsTGo/57pzY/HHlNK4GjntEixfziWsjH8snSITb96M8AWe7Lmn6+eynG2odmth50Cli64=@lists.infradead.org, AJvYcCXj2Ok6RpqYT9Dok2UXQrwBfAtBYj8HIKBtIzoivSsCTOD4eqSsY3nrybmltXK7nRzuPwPHaUhAirVRD7c+k5Dy@lists.infradead.org, AJvYcCXoe7H0popC7F3bbrE5CMYOjN/AT0oH30p1dLgCkaV2iy2CiDWefnIgUIrslqxGb3T9uut4Gmp2bSwD2EJaZS39/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGxQEWbas5THZQR/RW0L4GW5Hc71bFh1EvccWr4TJqtzITm7AQ
	7tMSUsD1+NTBCr+ylpcPVHBZwDZca0seTAGFRhrcpahpu8ClLVTRySJxbg==
X-Google-Smtp-Source: AGHT+IHy2ChbQeyZrKCx28/8OkE6XbQjadUgTgmofH8VjxpMdlc/BulLZcrsT3LIRUIu1mJy2aFspg==
X-Received: by 2002:a17:902:ce07:b0:20c:c9db:7c45 with SMTP id d9443c01a7336-20e5a7604famr168254115ad.20.1729494908190;
        Mon, 21 Oct 2024 00:15:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6e21:7092:f7c7:3951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0d6besm19607365ad.104.2024.10.21.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:15:07 -0700 (PDT)
Date: Mon, 21 Oct 2024 00:15:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2] Input: sparcspkr - use cleanup facility for
 device_node
Message-ID: <ZxX_eL_hs-_eKW0h@google.com>
References: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_001512_301947_A9A5CB06 
X-CRM114-Status: GOOD (  11.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Javier,

On Sun, Oct 20, 2024 at 08:27:13PM +0200, Javier Carrasco wrote:
> Use the 'free(device_node)' macro to simplify the code by automatically
> freeing the device node, which removes the need for explicit calls to
> 'of_node_put()'.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v2:
> - rebase onto input/next, drop applied patches.
> - sparcspkr: drop goto before node declaration and return -ENOMEM.

Can we switch the driver to devm so that issues with cleanup and gotos
will have less chances of resurfacing?

Thanks.

-- 
Dmitry

