Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BAFC5AD5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 00:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=; b=zBzOsDH6gz6WtaJE92Zb8c86/D
	ljEKMvSIHbDli2CP2A5lGvjeR6JAit58yp76z7oHoEtwfs464lbxxf6R9XCN0G2Ke8COzsu5HUTiW
	/0gEmYosoQzLIGN6rPU9Gd2HTPrH66AnYzcxZIu6TFRKf4E/aVDVb+Jd7RK8GkaCicJ2VotcmpPN5
	5w6S3RUQeWkzsJzcPG//1lelSH3yGVLM+1MdIdYxhLRpxIhphs7K0kdj5zxzFE0EQxHc3bh1EVvdK
	h8EriT9BzO/Limv1GSlLMHZ3HdUYKQ08t/mJc9JtKaRA8md79a8LecmAiXG7fjVnnSvNO/BM9vS40
	7x8V0Lsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJbS-0000000HDPO-2Lbo;
	Thu, 13 Aug 2026 00:47:26 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJbP-0000000HDOj-3wka
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 00:47:25 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1394636a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 17:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786582042; x=1787186842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=WN60Y06hjVq6ckfiT3k0Hd7fC/R+IpKebXROATxiRZCgeK9sY8/iDfQ4JL/eMpv+qp
         vy8/wpcCgwLFJuiRcym313Yj/2qUthJHnAPkENGUeZvmXTe5YXikKax6RKb2M2XphRcx
         jp7H0IDCJKUtWyurOV8ifd2VDOFY/6N4APCcCchJlEAt4erwsO5BYUo/M/JOVaG1r6Ds
         9p0qTOzil4cOVMVcHYIhRx+eA8ynvWi+5TdkAOH+4XSlaRwIfa5as7hmeZSOgUaSiN4O
         54MLT9PKuXT5k+Tky//GPzIWJy9gnsI9hDYF+EnjgFUZ+S/LUE/x0Yyei1c2kKEnA/VA
         ickA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786582042; x=1787186842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=auEUkv9gYeJwCZXUxiSwMOPaDpnfowSOnmdiSCdCZESfXlpzDwHKB8aavRozHF6eSS
         +zoRa9C4ffsTxHK83yMJ7pt2JfOSDy4f+mRxZbbeOdh7H0PTKxSekE8ZXNRQ/5OdUIZg
         xp1UPNAiPgGdCu/dnnr68N9hS7xehV5+VjX23c5Oaqt+CEYJiwsGUcVG7TTRko0Y/xNe
         cZD7tDLH8CzFx0fi6lErP+cW2BDbvSIQAArwbu+C3qSh46HxpCKtiy49AZIGaQ4oG+lN
         1Pxxu6CJn3/PjLhkgvXu/IXLrQfbm60ITg2xq0R9uF8z1rZHAXfGYicGP8RUqQy7KaZx
         LupA==
X-Forwarded-Encrypted: i=1; AHgh+RrgVJ2XzMflAdHNGfbSLG1Utz0mzWek8YbZ7aXepSqFpgsIIZ7skoJfw90wmAr2wZrRle3bBVY/GcKKZF5u2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxktqllSFCLtsjeaGuFFu0A7muRth5ImQAU9xibOUe43kzM6iP
	qG950X2GOlTwVgCnHZAEbkGyEid5ta7gp0HgZzkQYJzWb6Tq/NhUfUzy
X-Gm-Gg: AR+sD10NGOIL8CfUZFej+cAAZrlaXTmvZKVDVqCNQhenzowUz6CGMoBoyDjlywBOahm
	n3HJv/LGL/cssSXtnxir5VCLx5tfsLM6YoQUyYrWX/1K0TfRbChUKUz0o+60fwQduKOGNLJJKPP
	LeOfw5w93VsbolXkIxoOHgmsxruurQ8f+O2gwJS/M4DJdV0DxpgFo8NXLUF+2TXuzElNWHrZPte
	9b45wDcxNMuo4WnGsYCOrE/FLlkCJoaZRwjyqnVBoYXhdahjT9IOdlYj6EjWjCvBWCmmLHX+U+z
	ZFaXFjbD7O3l2BYMkER8KhZWYzfuRmyOGjPNxlx5tQVj4+wkVR0Kr4ZLIkZn2UtVSLkvmE1LbeX
	d9QMA1ldk9UP3Dxh4aMrsdiPwRn231d9O3jpOrlH4RlSKHgnZWftcILbw9F8l1dO0MwMONfP9qY
	kqIDkgn/s2mWuBo+SNvPH/EpIC+mHSpYg6CVHdBfszXhXvGl4/iUDMEyXm0vbA0jg/DgXo1BuDj
	OkUIzOhpVBSXCC2G7UORmJh/TPmWA==
X-Received: by 2002:a17:90b:4b92:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3931e079c22mr1944443a91.6.1786582042327;
        Wed, 12 Aug 2026 17:47:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8656:b5a6:1038:61b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732166sm1762331eec.18.2026.08.12.17.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 17:47:21 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:47:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Message-ID: <an0UEY6gigYTWFLW@google.com>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811122011.3539250-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_174723_983140_900FC1BE 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Tue, Aug 11, 2026 at 08:20:02PM +0800, Chen-Yu Tsai wrote:
> Sort the include statements before adding new ones in the next change.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thank you.

-- 
Dmitry

