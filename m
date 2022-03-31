Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaOPB5CV+IoejVNMDxX3BlpvqWt1PeLvWcwuyuKLGTA=; b=hbT/fKqn/ymLlQ
	j/nGa/8O3GOS9zzzciIQaoVwSh2owZ79JrY9BIm6yCEq98tlCJ8fXm6V6LAEM8aZEM6ivdd/u2IWJ
	RgIAUE3XyMBwjSdPK7mKUp+E7+psGewNODIra7V2OI+IMzO42qDXzOBJ9IJIVOE78Z3vH3EOriRxZ
	86tx0BcyCoazUm31rgljYsRVzKtV340RDh15HDX+ci8pUW5CBsYYvLmWyImjiBpbsUQZ0ikuba2Ef
	J5fW9uJdqq7i3NIZHNzaRNFqp84Hr67V+IVmLxvJw4NDK8Xn/T+xThfwcsfQGsvFs5q4k6F5Vli0m
	F2dY2iZDiy145x3evIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZvQT-002TOh-Sz; Thu, 31 Mar 2022 14:05:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZvP3-002Scl-ER; Thu, 31 Mar 2022 14:03:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9C0331F468F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648735436;
 bh=UuZ6SDmHiCVvg0ZsePe0pzcWXsk8m/CdsSVrEkAT1vw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l/j/fMah2T0gzbxw0HXYYPFYw3GOLf7c+zHWc9aKplo7Q4L6/6ivpCLruGjYvqFqV
 BS9v2a5j1tUC1qgCR94cDHy/UGMdYXGai83G8NVliYlDKve8SLsZqcfTjA0LncD4xO
 9dRg4DvJ6Rhlp871bH2OcK2v0wNhTRURqcs9MhtjvpwBYsVfWNUomFKeD0v9XSbooJ
 kLnoVibWGq79Jc59YSPjFmlyjOUNxG2PRyaZ/ryGPfUOj9H5yuGTZkPgENCihrBX22
 M6s8zKcFxRvSYKh/VlgzkSRyXAkTvJUCTEzssioZ22D6x5jhvnfgjoxoSg6FFlStLQ
 iMadiR/GkJTUA==
Message-ID: <515bd5cc-24fd-98d6-8b53-c2449cd9943c@collabora.com>
Date: Thu, 31 Mar 2022 16:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5,2/4] dt-bindings: pwm: Add compatible for MediaTek
 MT8192
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
 <1648730873-18505-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1648730873-18505-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_070357_670333_8F92529A 
X-CRM114-Status: UNSURE (   5.83  )
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

Il 31/03/22 14:47, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8192 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
