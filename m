Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBFFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXuvBSp4yfsZGweFm1As0ZGzxM5QWDbYzYES0MgakoU=; b=WuksetHGzzXixL
	OzfP+1LRVmmkGvrB0XOKSehdlFOM+n4vQ6YlNK9xHvduVOdAof7OgQIit/k2XAAIow1lPcSnuXv8+
	+sermF1ZFp/Niq+SOv6LCLKq2vdhaxgc3JV56IHxPTcOPq+Tgcvh/mM5sw0PzkbM4dnQH8MBkBFHS
	8ErqpzSO+RBpy+Yw42SxQzWBSRQaRX9+LlFe16xwH8Vy4WY5M6aXgDuAlamtVvA00Xm5lbx6n+tLc
	H/FdshZ0y2/gKTw2JkAhdb+3yHwxEsiU7SIYjLNQeJedG0FkFaTudZa0xc0D9juCfb5jplx/jirl4
	EJV6d8U+4xdUwn1f2cVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC2qr-0048cd-Sf; Mon, 24 Jan 2022 17:09:57 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC2qf-0048Xp-Bd; Mon, 24 Jan 2022 17:09:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 nn16-20020a17090b38d000b001b56b2bce31so433964pjb.3; 
 Mon, 24 Jan 2022 09:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QE8pJtTMoYdDHJAtBqji1V9DieZJck0kxv9CAHW5UMY=;
 b=crjmhB1Z+RS1q8ktQBw3YUhkzD7s7woazxvUAgl3Rrg1e0fOzcxmWRil91UdTZB7cs
 O5I7mhZVpzQAd6ZWPStIQVNkNP7AkoIJvyM+SWRtU2LdAWVI5FNctkqLgYMTz+QOrnXV
 1fH9p1vB7wXtDXz3vz4jRogELrTguBqjnG6ObubR+1/DJ+3S4Ejm8tlXcUvYuGAZT5Qg
 WQIdmnNsRzc2rdhl1T+kF+Jw0zb5sUrr1YUEtSAMU9LtxZ34eJ/s2Rt7pmp3fR5PqZzy
 oOuagTQP4oYb1rIEo6bIP8pYFs54esR4/FfC0a0bePIFrTx2RWCxtbSU+7idhPcXDop6
 35iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QE8pJtTMoYdDHJAtBqji1V9DieZJck0kxv9CAHW5UMY=;
 b=L1J+eof8CkpiAbZ2t4Q5Uaidx2tRkEiIPWaDJ5OxHVDgfy1a2qjRz/ZyEsd/BVl5ti
 p6k0d5yHHmKXJAG2fp4KnBZ6c2T1+y8ZFHICfJE2Zr28SMOJn+lIkaJ7NBZollM+mSru
 JtvrxIJ3TyMu+nnhWX0tsUfF6em3idvxhCPp0fOsmOJjCVqGaaj1Kf4FhTXV8fiH1vYq
 GR/CycyH2xQTrvIA1xD5F0oTAsl7IU6pnAVVC+IO6IBtCP38aTKSjIl4F8FS6a5NL0Qi
 ujwfmlRbSKBdi4JFDJP2Cggo1XlaolcS1bGnEL484VLSOP6en1TIn6VkDgpIxuVdRYUV
 Mj8A==
X-Gm-Message-State: AOAM531u4/6sBd3pmQfZ9GP35TdI9K2CIXeDDNXD2jXkuJqlIfoCdCcI
 5tF65FU+zTav8YWGogW/060=
X-Google-Smtp-Source: ABdhPJyCHG1ScNMOYjKnM4xN/inKbAncgw3P2Yy6QvhmPW7XJcuRbtEhsblpix6z34++DrJTm6TFAg==
X-Received: by 2002:a17:90b:4f49:: with SMTP id
 pj9mr2837537pjb.211.1643044183996; 
 Mon, 24 Jan 2022 09:09:43 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 g5sm13502751pjj.36.2022.01.24.09.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 09:09:43 -0800 (PST)
Message-ID: <562d9627-fe34-fbef-e908-d06a1cdd7cb4@gmail.com>
Date: Mon, 24 Jan 2022 09:09:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] net: dsa|ethernet: use bool values to pass bool param of
 phy_init_eee
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Doug Berger <opendmb@gmail.com>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Byungho An <bh74.an@samsung.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20220123152241.1480-1-jszhang@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220123152241.1480-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_090945_439136_C7F611DA 
X-CRM114-Status: UNSURE (   5.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 1/23/2022 7:22 AM, Jisheng Zhang wrote:
> The 2nd param of phy_init_eee(): clk_stop_enable is a bool param, use
> true or false instead of 1/0.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Nit: for future changes, if your patch spans multiple 
subsystems/directories, just go with the top-most subject prefix, for 
instance here "net: " would have been sufficient. Thanks!
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
