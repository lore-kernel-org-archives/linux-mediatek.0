Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2412EC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORA6EwI1PUdluSp+6ZKahCual4Eea24jtTiubPJhChM=; b=uBHIdLqNGNmT+qEEAYXcp1iQyK
	fr2PTK+RUCC25mg23eSVueOqUGIZOqDmuqvPzqAcdtHBXvnYQ8yq1FObOtqhQL6TlP4tewTDe7GVg
	+XGFnFcO9wHF81iWAIEQytQAUHdZFgnCAZa5W6hgviXx7VnoG6APCZH8ia+5DX9Fv7SR/qu6dMWss
	8ioy0wkXxdc5dju6vYfWFyfbi7DM6/OMZwK2O/aPMuSKvldFeolT6Mwjxi/ftfgeK0MOUeUTG1jbf
	MMTVwCUlwVxQ13vl4459qXneHiaO25fhkmZrl0pZQnll7asx8iL+/DM1vGxQzcAiGN4rvbf0DMWhE
	7i4Br5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIPS-00000006vuX-2HJm;
	Tue, 06 Feb 2024 10:10:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIPO-00000006vqd-1o77;
	Tue, 06 Feb 2024 10:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707214228;
	bh=c0L7QZYigfyLPmzRjA6nS5GyM2Z1QUEWyvUjNZ0gam8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cCe7Wzn8mB/Qc2IlweE/YDlAx4XfeacuEPNZi8O5b3+sWsF5QBYAPAlU8rHBGvUJ5
	 cdYZNevT/tmv/Z9t+j6a2Jg/g1075A9U8lgYjj5/WGb9cJUz5RLTmRDexmtlovQuH3
	 h9JcY1hYhAIp2LNyNV1I9F0ENfUFbbHx5uTFbw0zBVJQHyAnKQQVmwcVHuosS2xfEY
	 aJUB2kf/OqPh4vwKTtBi37VW8i1XMzYjoFndzVRFeDlwFffATcEznXu3JiNaCNloPV
	 ojLHP6VhrNJvj0jaFYF4XH3rZZPEVIJOMraFGnSkKBIONqH28EdUrgwwP+ysHQZeOG
	 cV5jZtl/Nr+Ew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A72AA378206B;
	Tue,  6 Feb 2024 10:10:27 +0000 (UTC)
Message-ID: <d5998dd4-d582-488e-b3ef-98ea9737dcfb@collabora.com>
Date: Tue, 6 Feb 2024 11:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pmdomain: mediatek: Use
 devm_platform_ioremap_resource() in init_scp()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
 <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
 <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6e397bf2-1d45-434f-8619-58a737a138e3@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_021030_841136_EB0BEB2E 
X-CRM114-Status: UNSURE (   9.33  )
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

Il 06/02/24 10:21, Markus Elfring ha scritto:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 6 Feb 2024 10:05:34 +0100
> Subject: [PATCH v2] pmdomain: mediatek: Use devm_platform_ioremap_resource() in init_scp()
> 
> A wrapper function is available since the commit 7945f929f1a77a1c8887a97ca07f87626858ff42
> ("drivers: provide devm_platform_ioremap_resource()").
> 
> * Thus reuse existing functionality instead of keeping duplicate source code.
> 
> * Delete a local variable which became unnecessary with this refactoring.
> 
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



