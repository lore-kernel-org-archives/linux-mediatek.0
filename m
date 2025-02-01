Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A5C0218A
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2025 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=; b=ZnwwhoxXEtCshhXHi/pTaL7wms
	zopySW+5CoDzAxhwZnKimrKJN11570sMzW5hGE5QNTAeE2LdHZXf0nJl5orC5kVNwxci7jstnVj/P
	Zy+Egl7aJtL3gsrLLd0VD3VCVM5CEPADg2/oDWJfsH+tZOHZIqSYpK8NYKNUS1Xh5xHAAUnWRsZFs
	II9N3BZ8sMUCf61Cf8kuBOpL06uBXUfWVOHnboOE2Wxg6nWUMeiE5sTn1OmT+/hJxUY3Ck6IATK69
	X/RO+5J5JnzDfBDej0jImg05kQVeXhvmdGkCvKw2tIgrQSf0lqXXAWnAn7tyofRWevuIiO/eNPAn7
	Un8n7T0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGJW-0000000CrQI-07vO;
	Sat, 01 Feb 2025 16:25:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teGIm-0000000CrLv-26XO
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Feb 2025 16:25:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-219f8263ae0so55712995ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Feb 2025 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738427100; x=1739031900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=;
        b=H0yjddlqcXHnnB9Dl4XVIBxpVmhO3YnC/o3pWuZEn0U4aSG9qKta/DMtxwdpPbGCTx
         pxadIutHPC4DBNCRunwSzgEzKUItgizSkypnSJ3sdkexqJbGhQL9lFblIY9P7ur8BEhJ
         xeTsjBhny5TBtwk1lpRGywR9opER+mEcEWIPLE5zCTJGMtgzfdSmBNmge3Q2a62BcLRG
         X8h3q5CIyQZNsN7rkleHB+ZuWls9OT0o8H9cljjb1emMVbn/LsdaZA68T6qlS/uEtmUV
         xw22ZlJ/rOKdYsjKnIGcclSF2Jx3jVN89v61hSRXF9LvhfYW4vGF6JRBOUk6yDzhufCh
         eJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427100; x=1739031900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=;
        b=w9uniB8tbYDb42QBYU55HCJk7j3vM2NuEaJe9ZfdA8dF25bT2M/wMtqII3vHXPgOZ1
         HdotnYUAG2LIYidt/8lqmvTNmprYb4Foj6pvtVxwIrQyAThiGqs4xaXxKfnMV/1VerF4
         9h6VniapOeWjmG7uawPUxwHJ41TgMfe1kh/184efgygx9HZYyxYqgojflXQexxo8BHro
         FfwHwqx0j0Bi+VPB0rdx8oU50/ihwtX52hk7u1GisHPRTwi/x7t3AZ1uaSyf4k91QloZ
         7trgSgJoWswxT7V5+WGlxcSPW7J0srzaJsDZPCB9MAzlsj0RPhrl/hzCLm6tWlPX76WT
         dsvQ==
X-Gm-Message-State: AOJu0Yw710RP2jhetGhvKLCRSt0gxzNZfEpxe1FlIeGRZfIrFKzmK67R
	Z7M5Q/mG4vlOVHSLHlKjIp9D2VkVLcVTaQkE5i9g1aXB9k17EIVkUc6y6OVLRw==
X-Gm-Gg: ASbGnctLGIzSd9B5uEu0+kYk7cjJ26gfmcYgOxoTWJ+sTzj23E3ZXmfJCYZqb1AvQo3
	nN1meV1cuRUF1p0+TnHjceEEByqu3+HiXBBiDVkifLLQGRLgREjOxVm7lfnJq+JG27E801msXw/
	IiKwkEZMKxBODAvMHfa1otOUx32CGuNEsOx7QYT4QCGJnwIHsQ+z6AM5QkMgaDHwioRg6uFoIHu
	pAPOEY+AhEr/GjZ2nS1AtUz3/HTCyjyHe/Das4fgsWidkF0pbX2B7fQYbFMNr08lfm8fUx3EUM/
	Cqd+mlgd4l93FXlomL14GFnIuLs=
X-Google-Smtp-Source: AGHT+IGTWHq/F06CpcrmFryngFoTcdvCxiBh6JdgpfJOZKD+GgbyyI6EvDWMGbH+eGJ1NmIPO9v+cA==
X-Received: by 2002:a17:902:f690:b0:216:501e:e314 with SMTP id d9443c01a7336-21dd7d74aedmr224666875ad.20.1738427099834;
        Sat, 01 Feb 2025 08:24:59 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm6324512a91.3.2025.02.01.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:24:59 -0800 (PST)
Date: Sat, 1 Feb 2025 21:54:53 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250201162453.rwnd7igaiwnngdlb@thinkpad>
References: <20250107052108.8643-1-jianjun.wang@mediatek.com>
 <20250115173156.a73ntoyyn3xy52ze@thinkpad>
 <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_082500_555064_F9A67106 
X-CRM114-Status: GOOD (  13.40  )
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

On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > when
> > > building on some platforms.
> > > 
> > 
> > Strange. What are those warnings and platforms?
> 
> There are some warning messages when building tests with different
> configs on different platforms (e.g., allmodconfig.arm,
> allmodconfig.i386, allmodconfig.mips, etc.):
> 
> pcie-mediatek.c:399:40: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:399:40: sparse:    expected void const volatile *x
> pcie-mediatek.c:399:40: sparse:    got void [noderef] __iomem *
> pcie-mediatek.c:515:44: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:515:44: sparse:    expected void const volatile *x
> pcie-mediatek.c:515:44: sparse:    got void [noderef] __iomem *
> 

This need to be added to the patch description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

