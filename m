Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA964C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoyY3ropWlS1QhbNGs3msh9xMc/2EgjLjsg1i5DfMT0=; b=ddgT2e5JzIiFax2QAwZ9+5EtT4
	yUI8Mf4tTJscFrioUl1TXpJnQObpHyU4yiaUaeyizWGYE4s1S4L0TyRDxDIQdVruMe32gbQEN1Ym0
	do2MFPR99Lvvatnv2ERy4H9VDMhJXkd7DyQ73hoydAa688f4wPoLBq/LVJcsYZiRVAg9f4GXJxKiU
	LEDnU6M5KcdnepqAFrJeyKZnXWWizDixW+uiWueGV7bMODiito67oJTZB8q9Wl0G4P0uVxGFlOPPk
	JVciyrB9+w+IoCYIeGLPM9tsDrqZb8jT248BePdndGT8ZLbw4VtlvkJkZSTNQ3xZO6JkyF1RY/Pjr
	ew3cRCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjWS-00Fotz-1w;
	Thu, 16 Mar 2023 09:03:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcjWO-00FosX-0g;
	Thu, 16 Mar 2023 09:03:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36FEC66003B0;
	Thu, 16 Mar 2023 09:03:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678957418;
	bh=EpLAQhKe/JmigVZzxVHT7Ip5Ff3Z539uGU8VPw07mAU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZEHI4+DqI61fKr3sXHlQior2URWzKF8jlQKDBGAMMaHnPG67TS7TrWYhuyEpr0pn
	 bJOJJlYXLez2PHstNwVypr3K6MjZwqnXFriu0Yecb8MpfygMIEl2mBZRYsL7N009Vm
	 8nKg8JbAwybAOdtvXToydhCFrkdJVkatXZfzHRI8JVEm5gv+fLVbO8Z6XnUoYFtmIR
	 uYrRnk5KfmUAxhTt20RnEWWhrTI3UmfhmFjsi4RcBrT7Car1lwXtp/Assku79V+Zf2
	 1xO/wbzdYDtT/o9KtqmOEaj2MGhePCF26n0bCCMUCIUXji2Ri3Pk95bhZM+e9Fj7Y3
	 WnChMGh5nepLg==
Message-ID: <490e5a70-885d-4214-c6b4-91ddd59db883@collabora.com>
Date: Thu, 16 Mar 2023 10:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 0/2] Change mmsys compatible for mt8195 mediatek-drm
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230306080659.15261-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230306080659.15261-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_020340_377687_D90F505F 
X-CRM114-Status: GOOD (  12.98  )
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

Il 06/03/23 09:06, Jason-JH.Lin ha scritto:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.


Hello Chun-Kuang, Matthias,

Since this series is ready, can you please pick it?

I would imagine that commit [1/2] would go through CK and commit [2/2] goes
through Matthias.

Thanks,
Angelo


