Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B262C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qHsW4X/mT2r/n6jtA8DyX48lLmynvOrt7r0yUBWzyo=; b=xB1g4SN8kpQ8YT
	yKXApzygGbwXWwYRXXhSulJ88IMzAfnXS50frtR2l5VPKfFnFmdZBR0w5+63KkGvDrJj+pQ3for+a
	PHTPhAdHWj2a48JYvWRTq4XRYl0F2Ih+Rdl9OBio4gP439nivPHAL40N5KHwuxTQXIN7lZyVlAwos
	KgSEtehg8aUaRfpDbDN1x6KG4ar0NQEXeG6hjCtNRSkXU9MCXdMVO/miAE7DkD1psAq3yh4WH/r+c
	YyynajpIk92Dr53/TCqVwQgUnA9M7JbfIzogXKhfbjTisOjhKUR+GW66A+VQLn60nHyb/GayTZviW
	6cK0aad/bzTEwll9ylsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoYg-00HDsS-RH; Fri, 22 Apr 2022 08:22:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoXO-00HD8z-Aq; Fri, 22 Apr 2022 08:21:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1D3581F46407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650615667;
 bh=jZ1yUGjJxRjIsaAEZvgaDDyTcXgwZTtd20No3oqT2h4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QwzsuzAQHVhSLW72Lj01+cKMVuyQIx3Is/+y9cGdlFITHgA70Ur02OemS6vpJWcZa
 oZR47AvmRC9bunA8smuAQhvMjqrx0FkU4Oj854Esjxo0iqCact9xy8UGXq9DDYXS2n
 BCfgVmNbovYyNRk6MyDiNhN+6xjGfOiO36vyhFIiPUaovRJtV75yyPl7Cu6MZoGfAX
 vrbCeFqdPkurb7rgxTpCt/KoUHM7l+MGMSJ65TJm7S9WdYhxqzzsrJL4WiiUYMqvUp
 m8TK15neG03v0oFuR4fOVIHyGG9/phd/kL/LNWVMHzQgO1txFhq+Z7Six/4tEiNbO4
 3Xk0cBUTeQ6FA==
Message-ID: <82731484-8269-786d-a01e-44a2ed960d5c@collabora.com>
Date: Fri, 22 Apr 2022 10:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 01/14] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422075239.16437-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_012110_604049_5B4DC4A7 
X-CRM114-Status: UNSURE (   7.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/04/22 09:52, Rex-BC Chen ha scritto:
> MediaTek Cache Coherent Interconnect (CCI) uses software devfreq module
> for scaling clock frequency and adjust voltage.
> The phandle could be linked between CPU and MediaTek CCI for some
> MediaTek SoCs, like MT8183 and MT8186.
> Therefore, we add this property in cpufreq-mediatek.txt.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
