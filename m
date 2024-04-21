Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424CDC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Apr 2024 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evdFeQD/L6zQL0Vd61pp1Z/7nDj1MNxAxQVGWpoT+5Q=; b=vmySQrGXloN5VsM7ztZafJMhOk
	bzcnF/3GWTiVSkYERLKgs1DPIwGU1wHxN7M9JXYOvJjM8UScueeTDpImRnjlubdfhXr3c2Ci5OpEQ
	fuLKrJMfAd5kUHSdQrWl4ADMssCWtkA/MlC8xJWTXAIHRFqwwPRHkLwoK3sJsX+o+Hx62KFw0aWec
	g6iKfzgmK8aFeNpUiqVw9N8+iVglpxIWao97Hj/75w/N5itCMs6BA+Mky1gOT/uXyNs6lf3MTBUF0
	Zv1R/TQNBm2+2CllUfORRc4uBsSERHEKjCOobjge3rVEp/ewVftXduGkhKtTvl3LiuVpwcKbZmS4e
	8nsdXQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryXCv-0000000AYv6-3WHs;
	Sun, 21 Apr 2024 13:26:13 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryXCr-0000000AYtL-37wA;
	Sun, 21 Apr 2024 13:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713705934; x=1714310734; i=markus.elfring@web.de;
	bh=evdFeQD/L6zQL0Vd61pp1Z/7nDj1MNxAxQVGWpoT+5Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VrMEtnc9KLC3MVNt+764ZSr+yQI43wvtrAxVexemR+a2TAlQU2e13mDeYYxxa41k
	 eBxqAT4Q9PO7QwttE0oQozSSRa0rOfTL7FmSWudrmTzm3PqZFHCyRnNn2l2uKMDcU
	 MjDU8myQE2eiYt0BCRDhkVqdmMyBFRienuQiUwRAsHvMD1My+eSbTEa+hTgry6y4T
	 Ij8kIPM7cRc7mdocsUgID8hImuuqQeWz4fJQCcFrpNWujyze8CU4SXP7r0U8NxLbm
	 eo0Kn9ZYoV9BSlI8C17rImOfH1pkK5oBEZ4PRGznRhR2q22Amz3aODSmAP5ETRTHz
	 xBLNIAWtt7/GLoELSA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MftBr-1seBTb1bXF-00fyQd; Sun, 21
 Apr 2024 15:25:34 +0200
Message-ID: <0ab13de0-0fde-40e2-958f-6a0818911009@web.de>
Date: Sun, 21 Apr 2024 15:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abylay Ospan <aospan@netup.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Subject: Re: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f+xcXKGB8fMYocFsidy+XXBPdzMxPgl2Bxmk935xBBJ0DD+Gcty
 j1XvabjoHGtqRYRbI3aytRF1rLCJy/qnL6uH5Qjwo2isbCxkSmr83hqGFgfb+rZindmRZkP
 7b5/xPOBLNxbkBZRtB+LF96jEnjSkG6NJ2bAerMk8dCRH4l+CGOCaV+QMLUd8dHLW9DBI4/
 IQgsJ8R9nI5jVnbE38Iog==
UI-OutboundReport: notjunk:1;M01:P0:xNXyt8dZPDc=;Y7uEzsTI8kIrdS2HKx1S7oMARXC
 zhL/9IZGvmHS+qMR1kWXhvEx0vczsVLuzYOS3s50U+Wh4kOFPFY/ipDb106XuODweI2z56ZYs
 epMaAG640SkZGwGkxo69M1FQhxOL86ofKVKBflyZ2q6dGpQhyOisDuATNDI4Da0RSRdCRwpIC
 wRMSldUQLSmAOUIC2Z7HuO+5G+IevRTVI49kTcmUBuN077tL7QQRBkjynLrWZ3SSSKJ9uoeCw
 RHxlZF7VU6ik9L7SCHYTpd0p9S9Q2sOKaCg2h0rWKoTJI1dc3qXedw0Y0JN6hk4dPndniYvAM
 IcGkljfJc78/PJhwKlumc51peBiKPUFXYXcpP1Jnor/n1SkoMn062xnKN00aiB+suto3tuobo
 oiBrqGPsBRh+Ty6fbUX8lAKSjPKS3eF/wCEGXkr6FlRWDlW8Lmp5wr/PmZfoZEUoiiTGblK3i
 Ey+yyh+IZSz4Ek5ZIENH7B4oyMdZApIiYIGvsupHXyo0F1YHvmjO8/K2eNIhcitjX1HRWrqRQ
 2JGfYGXZry6ursP07yqg/N0FCOuzzHDrpKQUSA+Z2FkoyedUr0IUYgHOlFmaC68041rele+lD
 2cug/M1AeebbQ68vxJFAA8ZI20IjTd7qObtFGEYUoneUNA/BR0/DoHTlxFPBMWHijnY1ZW6Fg
 Q5awNCoSI3V0k9sX3r1ReXcvlgT59yf5zk/e0ihl3a7dZbYEUihTv2d0y50NEmVpnPkWJ+V55
 NoqUyej3dphqT2IscNXw9F9aTiCntferd1ug6KOLmSh9O02PeaE/XxnjwKREdfRonSaN1Q84A
 Q6jpoxvLdnimwOaHSn/yZwiRAXm4FacX7YZbhoPrhcdUg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_062610_089830_510656D2 
X-CRM114-Status: UNSURE (   5.88  )
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

> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit nu=
mber.
> Make that explicit.

Would it be more appropriate to move the word =E2=80=9Cexplicit=E2=80=9D t=
o the end
of the summary phrase?

Regards,
Markus

