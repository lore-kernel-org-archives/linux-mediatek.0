Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C014AC5DF89
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=; b=F4m+JObGEB/XJU5kiqEekfR939
	WtKRRQfnAAXEt1rz6Ef//rPFf7gdJV6qVA1NpTczeaWTNdVwr4qMyMiNJxH/XHNGqZ+U2OKKVj6vr
	P46WwtFvnP9sKHZPFkwJcLHTfDALrh4+lq/SllnARW6VWtkqP53ZwDE5BwrkyodTv0sU7TdhSyr8n
	ybVAtxnbtsb4AgLdJ4I33byX/ef+XDB2E7GkyyxdaoszVQb7/cSbL2/dfIoAQzyhWJv0HTNMf2QXQ
	hy5Meqwi7U442+MQJL2cYyOT/FuXIxuUh5kZxzJ/KWkQMCfLcPn2li/pcbCO0JbZxCxkXhSnVsovJ
	lxCu/K2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNgM-0000000DDQn-2xRm;
	Fri, 21 Aug 2026 11:45:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNgJ-0000000DDPW-1WCn
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 11:45:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9MPSh1572264
	for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2dAxTCvnWQHdzet60v9peB5B
	pAu+xzdvRTiBy/vj54k=; b=VdgImv2GIIYlPoA7bawOCdd/z5eOizLUkWtHiKHG
	fMJ8kehGNhTBZ0h8fQUpLmO4aHVb4Mho+58HJbtXJmK7pzA7iwmysMFI9YwLuJLd
	0vJSyyQpP6DmL8TfPIZx52bXvBmaOa490uwxGO8tVnTT5LQPCWLV/uSDteUOUqma
	tE65aj8LOjjW4Z/rx/aq+6zvt9jwn5DM+o8amnjPhmorMlOraz66r8EKsa6q4pa0
	p5Q6NGTAo6FeLQBpnvIZHqRMWgICdneh/tjNO4EQy9HTiegVbpRhgIpeHu85e56G
	ImFfg188wowSrriSTZS6q40qjqQT91C/Gs57w7aUUKPu3Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue1egu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 11:45:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744dc532943so863613137.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312705; x=1787917505; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=;
        b=cMIFD5d8Lk/osT8HXdPmx1/1qRcP9AP/T7woZE4s0H2x4JrRzed9fjqIpOlFKO3nvr
         bPDAEjOzerSictIZPNDfl5DQwo5sHJ9y49i9K15nbpE35joNVPpARkkPGfgyHDkqBCHC
         IX/Np/KMaoo+3tkWqcNbOQbK9+k5HGTocmEEfpwTIcaCHfk8Xvix69nb0jNy9kP7Nq5+
         oO1HavWohnZqfd3PHx8BED5uBMY4Sj/iKZKOhnppmKJaFzex87AqK/IVpD06BHME6fn4
         3QMirfDdIZkUZicca/wz7WXM0uWZU40XUhaGvDrSjW8j4fCDUwB64sWKYmJ48VIPU0zL
         EbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312705; x=1787917505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=;
        b=C+afvYzNTEePJcYpITZzNGbYT2Q6Kzmg2iz726DpSSq8nabJmsY5qMsF2zwk+HiSzE
         ELVAeBjnyE9IgqjpAmpnvigvaAdrmEhPHHjefAVjU7mMZvOf2MBOcjK1LlzzgyM4rCFY
         g3yI4M1dwFyy0ki2QNcnJphkQ7x32KGvVjyKMxdJJrCsw66IM06ifkGRs9lzUiYkWzze
         x+/BlzMC+OUG3AuyojEjic0mfhiijFK4wrcz39ixOGMDE4ZYtLmzliPg8At6+vPvUiWg
         k0ogUHR5J6/U9uW0pCqYJJelAJXKMRulMICVSc8i4WvSwysO30LgE9R1wv2SWTOLc2Lf
         D+eA==
X-Forwarded-Encrypted: i=1; AHgh+RovOH9Uc1gl5lTgK1Qqjy0m/kr5//nAIXSzNcQfi3ABKrOu4hLGUznenisHZK8xXY3qojkPylazaUcZA6mJdA==@lists.infradead.org
X-Gm-Message-State: AFuF++nMKKzrYhPCEzxgPYcQ3J+pgo97Z4gc/OlPY1WN2S/skBE6/gYC
	cygc+mTifeiQTEwcGSUoryz1h0dlvaspewfRbU8x8Nnb9niIc+TrvDn95ptU0oWY+U2m9Xvayku
	XO3y3aT+M9REK2fWM1rK+VygTj0fmzEKV5mYnEpb44DpBia6JTh3G5p6kJxo4JbSEMwXn8OgIT5
	U=
X-Gm-Gg: AR+sD11qoKVYPEY9T26huo7nsKOQl5cymH7aHdLyUpy0cdlCc2vxlar4wt6cy2TVfD6
	fQ9ocD7NnGzAAnqW14okbV1ddQ/uGia7BgVppNBizAaRdFyJkNmIE3txdSTkwUMJvEpo9ncyZ+0
	EPymydI1znk52C/wV2N8KcDKPyBRC2oai+GzK+qKQbUgva3JV7VAZsozV8xO75nWnDOJO7COSRH
	gXqGDLYWIOisN9QfkCHgZ4+9FhWBqBr8rRrJq4q8gdTbkCPoa7uiWClu2x13ZK6IZF4MQhnN6Th
	Hoh+rmj8YiNEVYykcytv6CU7PLA4lkHruqjieHwyJLU4NJRdhP3bS1qDzuAJtUSiUllaA6wvT5D
	1mL0kvK8WlIWcxuc=
X-Received: by 2002:a05:6102:8083:b0:77b:63e3:6555 with SMTP id ada2fe7eead31-77b63e3c773mr239205137.12.1787312705056;
        Fri, 21 Aug 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a05:6102:8083:b0:77b:63e3:6555 with SMTP id ada2fe7eead31-77b63e3c773mr239156137.12.1787312704554;
        Fri, 21 Aug 2026 04:45:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d52sm6458300a12.2.2026.08.21.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:45:03 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:44:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully
 initialized
Message-ID: <gj4re27ahv3pusk5coh55xqrtj5dkigywa3sqysnifxpwsf5ch@fl6guu2elgnb>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfXwm/A0IOFb2Ws
 ifufyXQ9aNyV4/p01MAbmMI1dQSNezcp61gvO98izwPOrtjoWe5UKdj+ZuKN/BBkddR7aIyi/qE
 4VKQPOvRsTDg4tRd9YMq7iip/iZpceE=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a883a41 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yQKkdfHF0SNApnWj8YgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: MCewgdM66VOdm3ewrQyMYxPSffQI5eq7
X-Proofpoint-ORIG-GUID: MCewgdM66VOdm3ewrQyMYxPSffQI5eq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX1DYuMvloZLy4
 aT9x9FeVfnkH+p14lzmyA5wNgo0R3NPqQc4zBe9gAGpZq4G9ziEGM0/c9qDN7Eamew9Y9zuf/6l
 T4iKpPlG8oYxC8JFaMZiYhoZGaqkDRttM2y+wRE6tMbY6af2MIvx9bsl/NcQt7MLIYWwjgAZlYi
 jwD5dfyCLcD5CeztZ7o8cwrFEOVXuozQ+EaErammrINGRKTD2OCrfTzZQz0DGHOHc1L6wvmykFn
 7zR8HdzNswqd3WIgTbmWT3pDXXwgA+DEEZ/R+J1dsH7D13gWFVfPxCwjszs82DPYcX82n5YXiBk
 d07THuDWgc0Ai19dHAkXUTi3Ir59aUhHv+eE0S1apjDVonESZmIpCuAVbmO4YbmBI4UCrbDXkXS
 mEEi1GqkGijwTgh8tT/OJ0f/sqpBZdhkHx1JOjYbP42em/wZaExtsU+u/tRt+/cETxj0lrlGpfJ
 TIGXsUNQDqy6xxaXSLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_044507_518725_B6F60988 
X-CRM114-Status: GOOD (  15.42  )
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

On 26-08-21 10:53:23, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

