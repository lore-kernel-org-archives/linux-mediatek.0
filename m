Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA167D3C934
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=; b=gzbl27fjrHmRPTI1Aa175y6KMF
	Cia0cSYuio5JipOC+/AC3UXZAtGv/Pp+C36FtaP/8mWSqHkzIfavE1oW1LvmFscsfH0O82QWQ8B8J
	nMSNZNFx/Swr5i/5T5ce6cPQ31BjZmstcEbz00w554J/qyjmgC/WdcBhgbUQ+fK9Ciu2TSOQX7wsC
	Ydiej1HLHY8Vc84/lJ/SkIBoLWdlA8TN03+V0U+RRL+z4bDLWCwSXwFpGYSL+eQ3sePJSklY6RMJk
	AVQR4hX8Cj/GeURgsM6S7YQknxlo/9ApWd5GaYvdoohSCNInUnm+1bnjnRnYWCN+FyPziAR2lPlnI
	tFj/t7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NHc-00000004NSz-2xJW;
	Sun, 20 Oct 2024 04:11:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NG8-00000004NHG-3aD0;
	Sun, 20 Oct 2024 04:09:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20e576dbc42so20764265ad.0;
        Sat, 19 Oct 2024 21:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397380; x=1730002180; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=;
        b=Ys5Aa/oxQdB8qpLtIXJt1wBalyN4zEB4DZsoPRGE+3dJpCjPQnWRdmlaIsomp9pXZU
         4tvVM09X8uWQyxvX9NqcWqoHOhLoYIfbtsa5fyVtaXFbvYcGWU1Iqeyk26dHaLzr+CdZ
         /q809tbJhUcDhA7qjQqGKJUlb6vjW+LBLHhYaK2CfjeE59P4uEPG1T/1X/PO8D7XW7Ly
         Lch6li+WAO5iq8z5f5XWZ4ruqlWmmfFUHSd81IUyKVhudDPRThzcVT7jz/H0DOlU2g1D
         53xg+HquMwdBBg7neH9zg8Iigo68KQU4YGlN+VL4un3vhSUZwR0UhOXwxXUX6fx7ZWfs
         HXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397380; x=1730002180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1bGjd1n5rAZCn+evWllm1sc9D7H4aacdgC7A/pNYx8=;
        b=fRWHgthRfujfgL9ijnEdPHmVg8jwrSwl0YNK6p5GBviLzpb2OEa05dy7FeNx6zv4B+
         2wap2OnVXPV8yy7SL2wSYjOXYeGxPPQBqJ8XxPLdQZatXvVRbOdg/KNvMK3Tvl7uypKm
         sJi2neWGF6vA5genJqF+cVWjc3HQcDCcF41mrvuyZODSNrVQUFZOsqpIgOIMw253aEcy
         4Jb0+lFyzBfAaBTt/KoLPV+vsbsC0uhcqAbPrur84HDByPNuvLI4GBQaT046ckzvIkHd
         BJJnqGNs+oxKoOkUXpI7gqD4uwPEcrO1LJKy3BfBy6ylodG6tfJef+XnrlhHx3KCVin+
         FCjw==
X-Forwarded-Encrypted: i=1; AJvYcCUOxFTd5xVFR8y/gWqTwgn91M6e68iFxAUZXz0zHYE0rX61gH7/dp7Y6n0eAzmB14btUb5tgoz+J5tMcwGVMLsV9A==@lists.infradead.org, AJvYcCWycHKo85HK/59ZHqc3NvPr2ZzueEnVWbIChMAveUKSu3KfGlyZK6liWpNt6hcd3tAfFZHvISqgdkalkW0Ks4Q/@lists.infradead.org, AJvYcCXWMsZvDIt1atwQd+e7ruA/psdba5/UWlm5ySlhE3JPd5g4SBCQofJMWZjVFuCEJ52VBJqCbsD6zVQ4bXVQDBY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuEM2QIXWjCvfdYyI8vG/7DI1us2J8a3t8Cmug7XfzaJchMk5v
	E0LnCdG/VP8AxO/LAO27OT7FumxS0OatBRP5gg2oQSeMOG5gt43H
X-Google-Smtp-Source: AGHT+IEc2BHyqmStnpq7KA9tIyD0eDdNvs8sr3XefsuIF66d/cAZosyCaPNYQ6F3nVDJeuBmr4bFWQ==
X-Received: by 2002:a17:903:2447:b0:20c:db77:a4f0 with SMTP id d9443c01a7336-20e5a8e124fmr91966465ad.25.1729397379839;
        Sat, 19 Oct 2024 21:09:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f355csm4248175ad.265.2024.10.19.21.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:09:39 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:09:36 -0700
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
Subject: Re: [PATCH 04/10] Input: twl6040-vibra - use cleanup facility for
 device_node
Message-ID: <ZxSCgBd6th1i7B4X@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_210940_915455_5FF3F01C 
X-CRM114-Status: UNSURE (   8.82  )
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

On Thu, Oct 10, 2024 at 11:25:54PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that the
> device node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

