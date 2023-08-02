Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7191C00528
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 20:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PX+f8FYAk1kLvXF4nRrREcPiiYhPqoKlEdGXmQkzpG8=; b=bbn6RU6r0dpbUQLWh6k1ISmp2M
	yeo3ieSNrCENgXPLvSGhHSLrPidIHQd1PoSJkxGZ14KMnAx4SKewDng5fpgLq+tylj80TNoZ+vWiI
	efzhMhnrElqbPZszo5MERgACAFj0U6QFtE6XUgqaMaYU0vFG5tDynvptRytOYjS381NtrGwvwY8EX
	5qjXzABBDJRylFnxlx37oribuR/MllYwgqzyDGhPzzap9W29axyFeMsHE3dTXOlexqe7ozCscrOpw
	7JzSHLM2MOexwgZYjqbfOGtcSl7YWTYtn76CnLV261P0eE4vqBdbkfr1e2R+ApzBF78Ed1V/Bh9s7
	QwonYzRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRICP-005nfj-2d;
	Wed, 02 Aug 2023 20:12:01 +0000
Received: from 2.mo560.mail-out.ovh.net ([188.165.53.149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRICL-005ndT-2G
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 20:11:59 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.146.137])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 22D4C26AF7
	for <linux-mediatek@lists.infradead.org>; Wed,  2 Aug 2023 20:11:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bx767 (unknown [10.110.208.218])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 516431FD16;
	Wed,  2 Aug 2023 20:11:37 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-6684bf9d7b-bx767 with ESMTPSA
	id lfT3D3m4ymRdtgAAkSz/Gg
	(envelope-from <andi@etezian.org>); Wed, 02 Aug 2023 20:11:37 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-99G003c63778ac-0bbd-4dff-bfae-0bec4c240887,
                    0C641BB37B7CC30D107EA61C426C60CA54BC1A77) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jean Delvare <jdelvare@suse.com>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 00/22] i2c: Use new PM macros
Date: Wed,  2 Aug 2023 22:10:34 +0200
Message-Id: <169100562778.1919254.5355387350651563678.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230722115046.27323-1-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13293781676598954517
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_131158_024552_553A59E3 
X-CRM114-Status: GOOD (  12.67  )
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

Hi

On Sat, 22 Jul 2023 13:50:24 +0200, Paul Cercueil wrote:
> Here is a revised version of my patchset that converts the I2C drivers
> to use the new PM macros.
> 
> Changes since V1 include:
> - Previous patch [01/23] that updated the amd-mp2 driver has been
>   dropped per Jonathan's request.
> - [09/22]: Unfold _DEV_PM_OPS() macro
> - [10/22]: Convert to use regular device PM instead of using
>   platform_driver.{suspend,resume}. I figured it was OK to also change
>   it to use the new PM macros and keep it in one single patch.
> - [13/22]: Rewrap runtime PM line
> 
> [...]

Applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[01/22] i2c: au1550: Remove #ifdef guards for PM related functions
        commit: 45a21c833d23848487963cb5d7eab27d748d2491
[02/22] i2c: iproc: Remove #ifdef guards for PM related functions
        commit: 679e955c54d83743184c06ffdfae62fcd406825b
[03/22] i2c: brcmstb: Remove #ifdef guards for PM related functions
        commit: 6079d3054ba1ffdd3b85fd0b006a7130762ef2b0
[04/22] i2c: davinci: Remove #ifdef guards for PM related functions
        commit: d81a91c4bbeac742284cf34edd6ccf121cd15ddb
[05/22] i2c: designware: Remove #ifdef guards for PM related functions
        commit: a6ca696a40af0f652dc79b480dbd54096672d2b5
[06/22] i2c: exynos5: Remove #ifdef guards for PM related functions
        commit: af65727a77cc3c90e6d01bad387c7c8f337af2ad
[07/22] i2c: hix5hd2: Remove #ifdef guards for PM related functions
        commit: 38373903059c7e82d141007fe311cba237a00e86
[08/22] i2c: i801: Remove #ifdef guards for PM related functions
        commit: 02d1b6a99b4c5b4f05343aea46da96a8f795836c
[09/22] i2c: img-scb: Remove #ifdef guards for PM related functions
        commit: d2150e96646ddbd9a0f7f193107e7c310cbbe455
[10/22] i2c: kempld: Convert to use regular device PM
        commit: abef155faf2bb13b7aca9c2df74d63bb81ebcd55
[11/22] i2c: lpc2k: Remove #ifdef guards for PM related functions
        commit: a31425a6d93571433aa254b1eb4262ed378a08c2
[12/22] i2c: mt65xx: Remove #ifdef guards for PM related functions
        commit: 910047e7741fbfe15a4fdb14de7a2c3d72284d9f
[13/22] i2c: nomadik: Remove #ifdef guards for PM related functions
        commit: d55ee2c2f6fe629e6f8eb5b9c824b2545bc9b5d2
[14/22] i2c: ocores: Remove #ifdef guards for PM related functions
        commit: f5e33fcc30fa1e4085d6381f50b4f35ca412d708
[15/22] i2c: pnx: Remove #ifdef guards for PM related functions
        commit: 1670c7091b2aead73c21f3f27bbac44943d739ae
[16/22] i2c: pxa: Remove #ifdef guards for PM related functions
        commit: 605b9efba5d6a290f7ea41bd23ee5a11c3bacfcf
[17/22] i2c: qup: Remove #ifdef guards for PM related functions
        commit: aeb96820afefc02b8ac287685c9f6c75e2e56b31
[18/22] i2c: rcar: Remove #ifdef guards for PM related functions
        commit: dd4e0c0b6f01cf1c42d8bbb4a29d657a44a64bc0
[19/22] i2c: s3c2410: Remove #ifdef guards for PM related functions
        commit: 386d59093b247b258c6257525ff7c74b8ee9e6ca
[20/22] i2c: sh-mobile: Remove #ifdef guards for PM related functions
        commit: 8a76e5af8731db81ab325e734c5acfc386d3139c
[21/22] i2c: virtio: Remove #ifdef guards for PM related functions
        commit: 61999179835e23f4b245258087bfc20cf3c082ee
[22/22] i2c: mux: pca954x: Remove #ifdef guards for PM related functions
        commit: 458405d7c5b85e60a1b68972d1432d20fa9dc557

