Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B904C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVm8/EKnQZlRLAUqOfhtBTItjxghsAmMsXEoKcCzWMk=; b=SmPHFju9/dT4qmU36MH52X2BxD
	YxGbKZA1ITqfV1boQLTKTJB3JtsEW/rNvO+ExzA0ULDnzqEtKqzylVIpWVLImjVdFg03kXLLy1kpn
	gyPqcm3lVVc8aTf4WA5NOarv7VObpl4PuC4RoMbcs+3/tX16hSGkoGtCIg5UyKt2r9O2iMd+rGEjy
	1EYt9cROdigYiRD8Ul+MEaYpxSe/3OWsGtXwFOle8dQyFwzKvplR/TJoJSyMBBI7G144l2oC59b10
	1PUh1rnyeUbICpeJ1YJRnGHIPWonIJ+lfG7M1g6LcuZ00Wbnuc7bkpqIn7UZC6PpuuOjhTAz9NXV5
	eP8ZBj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ems-00HWdU-Mp; Thu, 16 Jun 2022 01:59:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ejL-00HUeR-2t; Thu, 16 Jun 2022 01:55:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8E0A9B821FA;
	Thu, 16 Jun 2022 01:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31226C3411A;
	Thu, 16 Jun 2022 01:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344528;
	bh=oVm8/EKnQZlRLAUqOfhtBTItjxghsAmMsXEoKcCzWMk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T7snCEzpRDuYN6Cre/BZH7apg77atmg/A34PxJfg96eAr8Ixre3dAz1gsw/ebvpmo
	 w3k9S1LEBmqNMf8a91eEb0XgM92aMXNNB2bK5wYqmXpvv24eBCpoTuwh82ZykWuojz
	 Ix0rnCFyiMLkJ8I712o3Pfg15kLDiMWPVxIuC5JDfdSahubSpS7Qu6vV5Le19SYlqo
	 PmpS6dlw1155zrfyqLX1T8o4ZTnbouum4eoVx2M4NxGONf9Wd79lCtmZyVU3lqy4wv
	 3V57GtnH9BNkk9df6weUm52Z/yBqcgRlxD4ckbl6/nWgXCWEaK4av2cgVPB8+DeZ2q
	 ZWi8yF5Us+30A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-18-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-18-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 17/19] dt-bindings: reset: mediatek: Add infra_ao reset index for MT8186
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:55:25 -0700
User-Agent: alot/0.10
Message-Id: <20220616015528.31226C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185531_296937_CB1ADFF6 
X-CRM114-Status: UNSURE (   6.89  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:44)
> To support reset of infra_ao, add the index of infra_ao reset of
> thermal/svs for MT8186.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

