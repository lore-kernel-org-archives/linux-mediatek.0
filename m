Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECF2CA0EDA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=; b=N7wWnq4CMHIIf1ZMsz0sr4XcQL
	If7fy4m0IaeLwHyrrguy46L/fSDyRoYwX/l4+VzTmuMDGNaVTjaY+CY4DpZnu0ZH4ipnIDxe02we1
	xyelzztBvbE5HVrR3ZA/CmLowAbnE0HtiI7JyiOdoFHvr8oEq4BL+nHQILY6g8VoAyGLGvjHg6TYR
	4xDFUKH2tpsDx3I+g0+Z8HbI/VY4h4GbfM939zMnQFCD8kD7wvKJv8WrGH7AtTar4yp8+B33JmqYj
	KlMNAm8G1kxTunvGQ3QnYBIWFqx8KxKuyh8dK9xbmxwq0BIuD/RaxWzLn8EppW0pcBblhIq257hJE
	spXyMMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIU-0000000Amlm-3ZEH;
	Tue, 12 Aug 2025 12:40:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull5R-0000000ALPv-1QJM
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 Aug 2025 09:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=; b=JIQvspGqAnRwsmlKpe3IB0N534
	xPWwd2TkgCm5Q/Kabc3VjcauQINORDW/Se8PVpjB5lMOTSa8pkiq3dO9Mh1pdugSmmpe/OaVUUjxP
	AsuelMpOQP4ND8ZKCnk6aEefnbCmjMVmTOWGsHBz6qylY2gDSshyYRWvRBFxOUMRA06fHXVcBGrXk
	LGR5xdsyT1K6gWOlyD9jlKfBL0NkW6c5bh6vGbHk9j95rzGh4q/tsLzXnuP7DllKBmUrTmo3Md+F0
	a1t0BtIFLOYliQnkViUS1uxQ3KEeBGMYwur8IKlzQzrvHeAkfTux2Gji/PZhnYZfsAjwUJ09il0ee
	ssUQt+Sg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull5M-0000000FltS-3nZv
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 09:14:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Y0Aw005398
	for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 09:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=; b=cfdgQiWNNxQ+3gOz
	tvXu+hfjH5tUiLlCYXVCQj4yajCG2tbwmGSKj8r6EPIclyHu34r1Mq6Yl5gff/Z5
	rjMhJd4x8GzKxE6kL3nIqqhOrnJOSnOb6Nrx14iYpIZqPgyuDd6VhuWRuyrNAynZ
	G9tqJgPuq4rYDPz+y5a0M3z3ORQGSwDcElBx7jEOo2ZRLufvhAIOGqeiaOdTkzjm
	tPMLfaaWIzvq2kY+T0SliAsuaDCHIBCqnpus61yCdav0D9wmC7jEiFf0YfI4ZUMZ
	BaNmNlevD2vZKyrsN0RYsV5OylahioN/uPBIRG74BeWZcuwuvK8/ihxzhffefMma
	RyIkIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5qsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 09:14:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23052fb8so8198351cf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 02:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990063; x=1755594863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clJ5A/6cgDIQE2u4HyX9gAv44cIhvX0vHF2jW/8Rc5Y=;
        b=g7WaVPoJNyNu/LLPPlhHqfXzdSSfAHK5TQy2kKcd2KaSf+6EXy1yXngF3AVtj+PX3S
         LaaQJpVf6oGaFTveF7K5sihd8tyzxc9kVatamfppz4LY8ZsKlkXL3oHtdAKJncGSO0Hx
         wdCs6ndcRhNq8dx/Z9s+Yk3MnVyxjE1NG9fswfdTVebQ9bNpUKGO+9SiuE5JQemM/xSC
         QfY0vBukkEu1KLuOy2dvTPvvsN8xplN9e8MVbMeQtp3RnE251I2BMmn+OvoX3ZOdMD0A
         uQKRls6AIST6nyMdQn2T/amISz5kSSQTHWUn8eWhF5W2zutc95j7JMHeYT0I+UIE5IG1
         9+Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXl+XIvOshvmPUPXH8Nu76cXy79rERvoJ+NN3aXAqf9ZsbJ6aNPlENn19vPhbZaa3f6ZIWUF+5HwukWo+Tq/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ7S9C8WU+Iu2DEEV96NvTUdjGm+aGKxYy/Us2QrwdzhlYrjY3
	UeOsH0K6dhaSzY/Xjvb8TmKzVRdrhVVlR3qgAFFFDH+zu9RhAhtWBPCgYTeVAuqYCDq2nRPxnEi
	W69wPGOx+8NPjm3tvnPck4RSAn07zUVjsWcAwc+HLGUQP2K7t9CFlssqvfKWpk0jp/X77Rhxr2F
	c=
X-Gm-Gg: ASbGncvxVvB26iE9LQJcc1JALqtR5AeByYrvjj/zHBztqM0SVxR4raYeBZjosHp17VQ
	3a6u1m5dBTXdNv86JywPzHFCGgP540m2IcrS1SKJOO2zIpN+RVcvcNlRAcoc3vBRsaGo3bgqQqB
	yT/mKJHQFsx6+LB3Frm9O/J9LO3HjKMWfOdylEYRjmx6NTQ40KCuRCw2fGjIOunjg0OGhHH4T8j
	4YwJXN+aiXELBtdziocKXYuUn3V80vSkP0rOSC/aOv6c4ohH796aTQoKhvSI5uCSRK2BoqaO0Qm
	y7jgTp7z3Wl/OVDefakd67iK7W9RkT7LhCpXQAmdvNRC8kS4s8R0MjSyp5eeNrVWsHvSMsZAE9M
	mEnYDxx43KaLNCbl9Vg==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2591741cf.9.1754990062653;
        Tue, 12 Aug 2025 02:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV6Qlx1UbGp6Aaax5Fxj5SKbEXoDO3q7jBZvznDhAU+9eJcmfQCUOIdtA9nAu77phChEO34w==
X-Received: by 2002:ac8:580d:0:b0:4ab:23fe:a743 with SMTP id d75a77b69052e-4b0f4ccc1ccmr2590471cf.9.1754990061134;
        Tue, 12 Aug 2025 02:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218aa3sm2185232666b.93.2025.08.12.02.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:14:20 -0700 (PDT)
Message-ID: <86b3f3e9-8a48-4580-82f4-68164e3022b9@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 091/114] clk: qcom: regmap-divider: convert from
 round_rate() to determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-91-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXzji9wkBjg4Xb
 2Rx623DzT0uO6EROTyIV9KD/Aav2WsWUoi4C1MfQE7yHzFxS0p7ZBFKHlqKTJWfQL5deBhP84px
 K73Tt6C6hMZVoa9QXTYEgC1Y+GgejEFFeM9tIzGjgg1HwmntZsIdqqV2VrvWTaeYw6rx+MIpJhG
 5qX1QNvW7kIMB9uwUhOpGnk2YeDN/R/TAkrgzZCMj8eOEKw/n2/wccCzwK0dBLgAreN2q3pPFtn
 u9mCrhVmzzLvWDexLfJIXFUQ99UUOjG6Foxy9yxBjDMY7cDQqkI6VSQXZH/aGAxu5OZwHxodsC8
 H65SkEkQndFdYrklml9wMtyIq+Ca9iE1j+jAov4b5SC1f9tOrllSfH9IZqovz9ca37SdJSTTmmy
 vAWB/erB
X-Proofpoint-GUID: t4j_E4d9OWARjks0yAb16K-ussU_nGxx
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b05ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=lhVY8u9YebhmjeZYKd4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: t4j_E4d9OWARjks0yAb16K-ussU_nGxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_101425_286910_1B94A623 
X-CRM114-Status: GOOD (  13.72  )
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

On 8/11/25 5:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Note that prior to running the Coccinelle, div_round_ro_rate() was
> renamed to div_ro_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

