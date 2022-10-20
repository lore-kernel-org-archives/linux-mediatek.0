Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B5C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 11:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhgC+Abd0WuIX0jwwpoQSAdRWaG7iJIDFx2Eic2Hskg=; b=3FxxQXqW9YtPi16RS0zkK13g6i
	esMP4WZE4OWTURDGNfpkitz3at8jfEU4b1LlYCNekVfUfYaNX2DyXvcFqtLoDjYHWDtHyd7+cpq28
	pu3ZBcSsPNyOXyjR5z7nUy+xuwcn1WFhnZROB0sUXKUUjDCXW1E5hAssPReC0tXU21t2rCFTnP04E
	d/dDfv9PQK9CGlKWwwxBoxgUuDJZfDD+NWy9lYj4tvotqRssWFAbI+NXA4lRGPfsyPJ/NiT1CkkPM
	cQTG30cX1rZgVB39hHqTF5Nj0/9vyle2MwKhloSWRsz9Z3FiEw9DiZlWqxwBYht97OTCEFPoMUCOJ
	h0WBSMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUBi-00EOLj-Fc; Thu, 20 Oct 2022 11:58:14 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olTDW-00DqKI-NM; Thu, 20 Oct 2022 10:56:04 +0000
Received: from [192.168.1.103] (31.173.87.29) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Thu, 20 Oct
 2022 13:55:44 +0300
Subject: Re: [PATCH 03/21] drm/ingenic: Don't set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
	<airlied@gmail.com>, <sam@ravnborg.org>, <javierm@redhat.com>,
	<mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<etnaviv@lists.freedesktop.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
	<linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
	<virtualization@lists.linux-foundation.org>,
	<spice-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20221020103755.24058-1-tzimmermann@suse.de>
 <20221020103755.24058-4-tzimmermann@suse.de>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <013ea55b-3d51-c89c-eff8-b8d355ded352@omp.ru>
Date: Thu, 20 Oct 2022 13:55:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20221020103755.24058-4-tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.87.29]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/20/2022 10:25:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 173210 [Oct 20 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.29 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: 	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.29
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/20/2022 10:32:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/20/2022 7:12:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_035602_830548_607CC869 
X-CRM114-Status: UNSURE (   7.46  )
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

Hello!

On 10/20/22 1:37 PM, Thomas Zimmermann wrote:

> Don't set struct drm_mode_config.output_poll_changed. It's used to
> inform the fbdev console about conncetor changes. But as ingenic

   Connector. :-)

> uses generic fbdev emulation, the console is being informed by the
> DRM client helpers already. See the calls to drm_client_dev_hotplug()
> in drm_probe_helper.c.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
[...]

MBR, Sergey

