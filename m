Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558EEC54FB9
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWEPk/3aAzX0I4fI4cuUC5y57V6oWUlKYqFVGCjXpJ4=; b=argVozOBqjPuGwwhbKCrD7SOQU
	eWpin7uiB+Icf3qSC8hcAlQBgLOKl5yITzBHz6ixUfDHsw+h6InPntH8RF9dgNWPzyd26Wsk7F/a4
	j6tfMKQjCqqrAW+zVrh8lbO0xbyxKiW0/t0zUnfKpd8JaVbu8/bxJ9hGAK+FIoEFzxyw5/r+VFtKt
	99q1lKLYbkQpAocUxNF5NUBOsy6HF6KaULF2nYCYcT4k/q27eVHpYbfTa0VFXEbRUDWXSK1Apy7gI
	6ZMF0+s/9Sg8u5dzpCsdhI5Ox5FpudbbEtfC0/M7qkurlKjoM4i41nKL48lVimbLR9RlGsulG0AJG
	O4Rbm4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4jXa-00AKO0-11;
	Sun, 19 Nov 2023 15:16:54 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4jXW-00AKNN-38;
	Sun, 19 Nov 2023 15:16:52 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-586940ee5a5so1903182eaf.0;
        Sun, 19 Nov 2023 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700407009; x=1701011809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWEPk/3aAzX0I4fI4cuUC5y57V6oWUlKYqFVGCjXpJ4=;
        b=w5W7rKOwWgEB4WUv/papumjR3NPSveIcp4/agfKjvk4bSN52rHAkdWbujdTMN93fdV
         KwDthRhTrfis+Sh6U0uiOtXur/sMdLYMFjvM9aTxikDlX7iN2GJmXkb84FnzY8wW0KWj
         8V3/vF9btz+eYMaECKs7ttppLIbYw6iPMjHWMLsURoYHJ8nT66xnIyQCSSimCaDuDOmh
         52WoPy9tY/rjaAbHk80SZXicsH9LDDn/IUXzO9epuIx9VJGAaEy9pfOShUf7Fi+MHWf3
         evgs2I8wROnWbxa7cHzuKYiNkm2jzimCXFk5D7Oxjc4NHIquRTeQqw0hv6DX9rayKs6K
         kfCw==
X-Gm-Message-State: AOJu0Yx5gT4aOxEodyHGiU043zTz9VGTwgZDMEhwQjXQgUyyF32mbGLq
	N/94yQX2EvdlOwNjdTj9WA==
X-Google-Smtp-Source: AGHT+IFTumx8nyQQh6n2laOF1YkhSXqTh5bw2xAJK/w4wHOJAQlPpzBcTyUNnWCP6irMM3KxJR5Kug==
X-Received: by 2002:a05:6820:1c84:b0:56c:cd0c:1d67 with SMTP id ct4-20020a0568201c8400b0056ccd0c1d67mr5808089oob.7.1700407009353;
        Sun, 19 Nov 2023 07:16:49 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
        by smtp.gmail.com with ESMTPSA id w18-20020a4ae4d2000000b00581fc1af0a7sm1065154oov.28.2023.11.19.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 07:16:48 -0800 (PST)
Received: (nullmailer pid 215792 invoked by uid 1000);
	Sun, 19 Nov 2023 15:16:43 -0000
Date: Sun, 19 Nov 2023 09:16:43 -0600
From: Rob Herring <robh@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih <jades.shih@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix Yeh <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v7 02/16] dt-bindings: hypervisor: Add MediaTek GenieZone
 hypervisor
Message-ID: <20231119151643.GA213170-robh@kernel.org>
References: <20231116152756.4250-1-yi-de.wu@mediatek.com>
 <20231116152756.4250-3-yi-de.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116152756.4250-3-yi-de.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_071651_041631_2EBEB28A 
X-CRM114-Status: GOOD (  12.45  )
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

On Thu, Nov 16, 2023 at 11:27:42PM +0800, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> Add documentation for GenieZone(gzvm) node. This node informs gzvm
> driver to start probing if geniezone hypervisor is available and
> able to do virtual machine operations.
> 
> [Detail]
> The debate of using dt or not remains intact, and gentle ping seems not
> working on this issue. We'll keep this patch for further discussion and
> move forward in order to rebase based on the latest rc release. For
> previous discussion, please kindly refer to the following link.

Please explain in the commit message why this needs to be in DT and is 
not discoverable by some other means?

Rob

