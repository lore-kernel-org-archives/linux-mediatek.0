Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB44BC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P1CtK0EpHYNB0bkUEbNbkfg4BjOcYJ3BMKesAvDyvc=; b=f9I7URsgaqWogz2nfILIldeb2I
	EeyvlWwiF17Y6w+3yvZyxuz7rD63QBN7EaNbZaijxd4vFQnrDKMtsjsIbTPX4rn7lNkv6qiDr8Lxa
	Ify4XJu3M97o0DFV8UgQvZK02QqJT5cvOzf1adCrNsJzdUTPmTUvgIvwg4ZGBbDRLONm7AJg3TA0f
	S/pN+Wy3vCV2DbahIaYLE5/HaC1U35HlWapp0m8vhBLIViFckWtTdhpulDrFrNRDVcFXrKl9XB7Nr
	t4r3KaqVp27eN7FI5NSJXN6RXS82696E4qu02IL7ArjI0Svq4wt/N6Dis7yeDGMXnUHR4PItn7auu
	m6xBkwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSQy-00GQ4P-18;
	Mon, 14 Aug 2023 07:56:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSQu-00GQ3q-17;
	Mon, 14 Aug 2023 07:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2P1CtK0EpHYNB0bkUEbNbkfg4BjOcYJ3BMKesAvDyvc=;
	t=1691999767; x=1693209367; b=nqqijah2RTYHKPxFf5roePfAxiUGp3WeQ42/CR4EdQmiHel
	L6WMTilJ8I4JAaEtZ3y9Wb/XZZQ3sjvTTNhvboj0st23VI0jV4sbGNWj51SVBocvG71UkaZZVsPn3
	QQRan6CEf+Oe2f9hu+aWx8Znt3Rl4H6abhwQ05tTZdI2WxfL4Xgv47vw1hfvM8ckSutzb1UVFRWTh
	3B5f0OlwNQrm7V6JZpxzG2YwAjFtlixlo5PNpMSsyr1Ufk1KFCQf8dUAvq905ijTXQYPgBobP/FLg
	P1gQeu+8JlVEKbcncimz1u9Vp0i876radxOmp1+fTCppbakFmEpQmdVxkaPW+nMg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qVSQ8-006VTj-1d;
	Mon, 14 Aug 2023 09:55:24 +0200
Message-ID: <8c6d19da5c4c38062b7a4e500de1d5dc1280fbc8.camel@sipsolutions.net>
Subject: Re: [PATCH v1 net] page_pool: Cap queue size to 32k.
From: Johannes Berg <johannes@sipsolutions.net>
To: Ratheesh Kannoth <rkannoth@marvell.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com,  ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com,  jiawenwu@trustnetic.com,
 mengyuanlou@net-swift.com, yang.lee@linux.alibaba.com,  error27@gmail.com,
 linyunsheng@huawei.com, linux-hyperv@vger.kernel.org,  kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
 longli@microsoft.com, shradhagupta@linux.microsoft.com, 
 linux-hwmon@vger.kernel.org, michael.chan@broadcom.com,
 richardcochran@gmail.com,  jdelvare@suse.com, linux@roeck-us.net,
 yisen.zhuang@huawei.com,  salil.mehta@huawei.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 nbd@nbd.name, john@phrozen.org,  sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,  matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,  linux@armlinux.org.uk,
 linux-rdma@vger.kernel.org, saeedm@nvidia.com,  leon@kernel.org,
 gerhard@engleder-embedded.com, maciej.fijalkowski@intel.com, 
 alexanderduyck@fb.com, wei.fang@nxp.com, shenwei.wang@nxp.com, 
 xiaoning.wang@nxp.com, linux-imx@nxp.com, lgirdwood@gmail.com,
 broonie@kernel.org,  jaswinder.singh@linaro.org,
 ilias.apalodimas@linaro.org,  UNGLinuxDriver@microchip.com,
 horatiu.vultur@microchip.com,  linux-omap@vger.kernel.org,
 grygorii.strashko@ti.com, simon.horman@corigine.com, 
 vladimir.oltean@nxp.com, aleksander.lobakin@intel.com, 
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com, 
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, p.zabel@pengutronix.de, 
 thomas.petazzoni@bootlin.com, mw@semihalf.com, sgoutham@marvell.com, 
 gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com, 
 xen-devel@lists.xenproject.org, jgross@suse.com, sstabellini@kernel.org, 
 oleksandr_tyshchenko@epam.com, linux-wireless@vger.kernel.org, 
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, kvalo@kernel.org, 
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev,  kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org
Date: Mon, 14 Aug 2023 09:54:56 +0200
In-Reply-To: <20230814060411.2401817-1-rkannoth@marvell.com>
References: <20230814060411.2401817-1-rkannoth@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_005612_611779_A24CD220 
X-CRM114-Status: UNSURE (   8.92  )
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

On Mon, 2023-08-14 at 11:34 +0530, Ratheesh Kannoth wrote:
> Clamp to 32k instead of returning error.
>=20
> Please find discussion at
> https://lore.kernel.org/lkml/
> CY4PR1801MB1911E15D518A77535F6E51E2D308A@CY4PR1801MB1911.
> namprd18.prod.outlook.com/T/
>=20

I'm not the one who's going to apply this, but honestly, I don't think
that will work as a commit message for such a change ...

Sure, link to it by all means, but also summarize it and make sense of
it for the commit message?

johannes

