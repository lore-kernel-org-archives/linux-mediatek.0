Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1F3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+siTabADeJPoKVIR5JDJlHXEzRgAuNdB75qGITVVSk=; b=QAUY1+ODkDwGLc
	Z6sFkQRzwrhZnq0Mi9K1HSumYgqZ+zJb2vTGuihRv9SQ6aru8iGiOwp/R0n6DqbqKCxvl8UhRCwwK
	CYE27GFoPmP6JRWw2lOzfImkG1LBQYGf/gFE7i9xfbQfWzX9ll7WmwyCgRobL+PTQOtgu1uHZGTUH
	yL/TWcHJGKoykVdLojOn7lVXL1tNNRpbYpWQ9Mq0MtYixGu9AnIwTOkEnpWpqAw0odfHI2xmI5Q1G
	OcEKbWUuE8TGUL8ihqk1p2VzvUsL74jKA5Qry4mgWwk6U+ki4bqq8vvnnfS2oLwSQstDfvDa7H/YD
	EKTTjHjrWP9mP+8viCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMRTF-008krB-Aq; Tue, 22 Feb 2022 09:28:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMRSU-008kUM-Bb; Tue, 22 Feb 2022 09:27:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EE3241F43FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645522065;
 bh=MdZurBuq9axqusVBi5YQQLGygmXNNP6z+Jk82VTqNgU=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=RJCRdvBMiLjvDfFdiDCqeX2H9yzu6MOqb/NCRNf4VNtjvFSPN+Xwe8vwBq/TUFBHD
 DGKN1wkWYYTO6V4ks9/8oCa682Vrld+jfEx7X6Pqo/1Vdx2Yks/ekEXfUj0i7F3EAV
 ozcIrJmNg1PW+e/sBFOXupHX0Y8Sj0R/b/RjJxPsSZdBJljqmu974CCa/dIS7kdG2S
 WycItOPiKoUFeTrkQBJ6eRcVzru/PhSW+jhRu9+0h6TxYUwo8dOuY9oKn1zfLJ1HDT
 WjCcsVouQMW55S+4jmaV7ELVwVqYgbB47+rssJL6DakBY+zvO7zoXRP+SIl0Re5wFm
 90NVJV6QbBLig==
Message-ID: <be5f101e-b350-33f1-3994-74524d229571@collabora.com>
Date: Tue, 22 Feb 2022 10:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v23 6/7] dt-bindings: soc: mediatek: add mt8192 svs
 dt-bindings
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>
References: <20220221063939.14969-1-roger.lu@mediatek.com>
 <20220221063939.14969-7-roger.lu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220221063939.14969-7-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_012746_597634_46CFFBD3 
X-CRM114-Status: UNSURE (   5.84  )
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

Il 21/02/22 07:39, Roger Lu ha scritto:
> Add mt8192 svs compatible/resets in dt-bindings.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
