Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C95EC61DBC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=CdciQx/32i6v9U1neld+85R0Qw
	A5NaeH2G8cdFR/pNAR8NeKg06DcdIXdCtIsFAQuMZ8+AAQAeUz//mT96CC7PeuWwceQviDMRdV2XA
	8zSrxXjFxUrt29gP/2CHTGYvR3eUYuHRxFE23Bq5hWYeZ6Jr1XtWUgZiR9MixZhat9X+3PTn1/Dpy
	RPtgNg7/7Pf/D5KL6zES0fUvPVBIKQaZQZo024bn2wIc7ZsWYJ8eQfLvkdvE/Ub8CQGG3cXFnQXVE
	PcGypEdYlxIA5Q88VsVuhsgnHaUen5yZ29wHO4d6G0Uncip7KJk892N7g/zYY41n4MwN9lgGbMoRv
	fMZQMiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wym5T-00000000Knz-0M2U;
	Tue, 25 Aug 2026 08:00:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wym5P-00000000Kmr-3zCJ
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 08:00:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P72AEt1228078
	for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 08:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=hW245yiuzPpw7Zc7
	TgI5VNmqUcEW+F7q3OTTfJAr9m+I8U+Mi99eCl1qdFtPN2dzojQ3waErOzZM/SV4
	raw/gVvUm3SlExnqFleFA4w3we4B3eHvab/tWFLtTjSZXJfySDZ1DKqwOkHzrh9y
	+zGcn1Vz17mWFL/hvjpDHkwGf9jZMNi6GCRKAaTJ6aUKu4tlA37r3CBEXy+uI1BU
	nO9dfrLc6QhISS+yH/aHgJt0l/HNqwUSn0YC5a4QhIYZwS6zr9RomQjt9CEwUj1f
	SE7xuEoZrCDNPmc33MonGrwEmaAcBQyGQD4H94PSwHSRoxoysR8Tr3DQYjQOiUNi
	/Hr+0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abr7h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 08:00:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso6685592a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 01:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787644845; cv=none;
        d=google.com; s=arc-20260327;
        b=hIEXqmPax8cUwH4CEY8fbaP1hubKnTnWnN0X8eWL4SlX0gvvOz3iYaNV1QcSOkpi/V
         KxrEVh3SgpwRSr3bkKvPY0F2DpE8d1AhSmR42+J26vixU3uOLa2ONACRvRM34eKaHrDo
         FrlwVj0EqV0EsYLKUokVbO20GCIATPcnWsutwcpO0ANRP6p8kL1mEyYcTQBJZB6tDQ0k
         iuwUnH4vbDTzFzneVxoiGVLBwJZtx8dphQwFRKWzyF45OpxpfgKPv6rhdbl5FSab6pe4
         f1uw+48+MsvYJGibTTV2FRcunBWZszZxg1HaEQH1KhJVSy6A6VwOCvlPJv7Au4YpVxRO
         CnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        fh=3DB/DIKpCSivA6rG8hL+U/7ggOCejdp+9kM3DZpFNb0=;
        b=SpGkQMPGiLCaDv4gu0xL4TwnMCHhEXwG79TZcPLfnbGZEoHxiiGZ9CAFB08FttdMRb
         +LMvnUUGkDnvt8SYDW5/ZEhRkcTXBVxkflW3a4SBraM8LryN76lUv82t1t7ZIHqMltl4
         CcSp55Kl62uK/yNVKCqKqSEygkYyTrFh1J3VMMSx8b2TapxXfvb4F52zWfYsJ4+51q8i
         jiw9KMqVKpIBPNAvvc6PNhURo2Gx9JxBntZiT2T8f11K/IPU6rKHrrM+ANLhlPNWP3oQ
         rKVG8P5PmJi4S6CqJhZbLRwZibfrOjPqmJsuPeT7YYFs/cxn1vcZSKLl5M3zj1ZmBDBl
         wI/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644845; x=1788249645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=YCoGKzUBqCxxREGBJOCml0YkcYgDjRcX3b3wK5/PUbiiaJiZAekTnTZ3PGOAQSJqNL
         UFvZ2QjoYQV126BzQbOJymk0zqGPq4NU5FksBI1mIQ3g7/CNd3kJJD5Eovvv0NxGnjN4
         ze24H/haYMOoSD05i8Uz420Xq+z4D6VeEEjOWO2/HRHJZCJQ7ADqiJMSxELGVHy3Yoq7
         alXgfuTHBrj0KjAfO/Pv0sC7508mFIumW1psFPJ/XmlBo9thHaeieK2l+ZTQLtNezBJO
         Hnpousz8vZBTQDQGKEKfkjEeULnu8M2j250mqFlO2fqt+XmVLWRGMIKIUFqpwuEg4+fh
         WfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644845; x=1788249645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=qmKus5rIKawN/Ur1lFgqMTIvTeavXKk5r9EYv0ikr0SAOEnD4qTZPspUGKmv0tyueh
         tSsPw/F9acb3mI+4Xmqa4yd5OG5xsB5DxcPsaUPhN2CA2pGL+2qgJXZNA85JgrbngvyN
         ymrvaYaTAcfHSx1c21uhHLPExv1c1orAXSQObifdyV/eFKlXtdWDCfEyqUCMA6Qsqy7r
         DwVg0S49BZldZ3B6s29sEG4vqAWXRZFcibvfYgKI2zQxjrJJIA4P5vC5+TTQnPnYVAbB
         jaQe/v4o6NBGQb4BxQwWPkHpXS4TyvlpPXrCYHJAl/cGL5APqrfWPSN0yMbmDdQtPqDM
         uJIw==
X-Forwarded-Encrypted: i=1; AHgh+RrP/RzcAVvo2WW5hyViHQTibz/v5MwriyzcC4vB6gpDrJhsy6qeJ/KhD+5ZkOak2L9u8c778sR3uRb0xHb6YQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lJ/8GHbLHm9emEJpbbF7jrtr7FInIZFOsXLvuTrVGvGJOy8ZRQ
	PxX6Nc3JJgOCvaSI+1VDv5XgBrU/LlOlKAUa6OBPUZD52ckKnSuKDLPao8I4G4tc/j5dt7r5oYy
	Ajmob8YRbz6YJSOt6JztWqtHmKP3FUg2deoPV2/Uk7Pjsf7zAydkyCada3ZgBV3O7+ADSUlcrYx
	gpNdirUkXSywnIFkeE9VJXU1uRLgN5x6/Y4vXdZlfTbZDfxIMo2A==
X-Gm-Gg: AR+sD13tGGL/3af65IJ4Xk/TcKEPiMSr6Sp72R0RSKj15m4/WUHb6u8JKQxHsr4SJ0L
	QtLRD9xIfARUThZO+SoLS4bEPzg2Nf8i6Qcd10KjR4AXmBXfF0oMo+gq9GnQx2ym74Pord9UFbr
	pq1mCKWGtfO8CqAmQ9iQ9cxCUvnUhbY4CDUhvrY8nNE44X+UflAre9vQBxBQ==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr54366385a91.4.1787644845005;
        Tue, 25 Aug 2026 01:00:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-395c3367376mr54366138a91.4.1787644844301; Tue, 25 Aug 2026
 01:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:00:32 +0200
X-Gm-Features: AcwNN1WaGLEXokEDN-w-P7YAI63J28S_AjYowYxFfZoRRRkDa1AUJBYrsKRUG74
Message-ID: <CAPx+jO9LSfy6-3Gb1+0RvHeVeU9dAN+-1jcGaCESpTZXEAE_YQ@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
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
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX/pQ05quJ34QV
 MbaKUuoOzD6IuU/OI0hU2nzPOihCKjFzRoIfEAH4A+w/Ito+LmiAOWd9G+ckwULNxfOu4mLX5mE
 xa0tA3edA/dsG4L/L36FfymFv2kzRQKlRWx6MAXwvKnWFPwbYBC+S740wUFdYv83CPTB+Uf/BSN
 is65vOGVDKRWG8k+xy2a+Vg51LMq/KWR27kvuEsNP5dWgtBUTcA3c98BBHTu3KdXilLRjpKqM5R
 n9znV8dnAszktfug70qZjqIUAlaxxh86mlTOuLUabZeYF7ncMaTbvTz7Dp8eZ74L+jIzi9wtoAO
 woAxnSPk/arHb7YVyEL1HhAkCo7jgnvDO0tK7HR+U42eB0RwfJXGGClVEFy3+KCoRlejRfN+RaT
 dFJgZ9Tk9lfCtnsJVwCYkslMJpoQMAQzWTcjGD4KyvxmC6hJLQOtiHNbkvVKtsplkAQf4pNUcCc
 1VeKa9K6pifq5b2t/ZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfXzDkkfMHyM3CC
 pWmAPCp7lmMgcDy2SgYbBcuYCHki62egYk9HuVN6j0AKhX5v9IIfPQPsqvStyXNYJ64quAyyULK
 8a4bnsVaLV1GBkTF16b7ogiP8neBFbE=
X-Proofpoint-GUID: o_90qx6JNNOkNoJSO44HfixUAsKXh0fc
X-Proofpoint-ORIG-GUID: o_90qx6JNNOkNoJSO44HfixUAsKXh0fc
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d4bae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=xsHTnWN7LAWtonkW0D4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_010048_108980_7184C7DD 
X-CRM114-Status: GOOD (  24.06  )
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

On Fri, Aug 21, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
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

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> Compile-tested only.
> ---
>  drivers/clk/ux500/clk-prcc.c    | 2 +-
>  drivers/clk/ux500/clk-prcmu.c   | 4 ++--
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcc.c b/drivers/clk/ux500/clk-prcc.c
> index dce235df2576dfb2..dde72d2fd0ac67ae 100644
> --- a/drivers/clk/ux500/clk-prcc.c
> +++ b/drivers/clk/ux500/clk-prcc.c
> @@ -97,8 +97,8 @@ static struct clk *clk_reg_prcc(const char *name,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_prcc_ops)
>  {
> +       struct clk_init_data clk_prcc_init =3D {};
>         struct clk_prcc *clk;
> -       struct clk_init_data clk_prcc_init;
>         struct clk *clk_reg;
>
>         if (!name) {
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.=
c
> index ac96c46bd1bbf76b..d89f3b634f8bbd26 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -200,8 +200,8 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
>                                     unsigned long flags,
>                                     const struct clk_ops *clk_prcmu_ops)
>  {
> +       struct clk_init_data clk_prcmu_init =3D {};
>         struct clk_prcmu *clk;
> -       struct clk_init_data clk_prcmu_init;
>         int ret;
>
>         if (!name) {
> @@ -357,8 +357,8 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
>                                     u8 source, u8 divider)
>
>  {
> +       struct clk_init_data clk_prcmu_clkout_init =3D {};
>         struct clk_prcmu_clkout *clk;
> -       struct clk_init_data clk_prcmu_clkout_init;
>         u8 clkout_id;
>         int ret;
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysc=
trl.c
> index ba3258c88d28e101..2127a949e56ccf27 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -127,8 +127,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev=
,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_sysctrl_ops)
>  {
> +       struct clk_init_data clk_sysctrl_init =3D {};
>         struct clk_sysctrl *clk;
> -       struct clk_init_data clk_sysctrl_init;
>         struct clk *clk_reg;
>         int i;
>
> --
> 2.43.0
>

