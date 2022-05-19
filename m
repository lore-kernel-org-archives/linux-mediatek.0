Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F50C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euBAjBk7KOq1yQxxQZp/i9+Vw1A1LjrxlWTXaCtFIg0=; b=ePKsBkzvGH8SS0
	d4DWvky4qLxS++fQlFt7RD0qwNNEIIK+0Z3xgh0moB0SyuGmSSHgyCVGLVxMPbwC00G4jZzjlQNzf
	p/3C587WUykLuMNu64HEhM7tpQliZA7gXogsX8wXRMKQn6u3NnxRDVqcC/SKwT/hzDA/mq+6T2gnU
	9TG+Y5LwtLjuqYZLm/8Sa6U5MNih23EucDQ6hxMEK7CTGzK/nqhJ/zPBqyQhvZm6ndvxwn+AsLdYH
	j5dIvz6qZrt0XBkAqNwLFrEYlbUDhU7qNXuGdKytue2nZ8zeFo350XN8SzfNEHRyc3It+Iwsyn6fo
	wWeJ9n558qTyDjsOi+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbcl-005t8S-Sn; Thu, 19 May 2022 08:35:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrbcW-005t07-Pz; Thu, 19 May 2022 08:34:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0A50E1F4579F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652949295;
 bh=FZgvMJ0kHgvO/lRqb0qbd8VZzOHceqNAMCfwzMKqFIs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IM/HW1THEui3bX1ea2rHydF4flBObYJkUsRcNngJ6uqvKLR7FEOHg/AWpkM4DniMD
 dLZxrHULt08D1XrqsDVLHiUi7CogBQMCbyK8obKoIC+aj9ooOftHQlyG5IeUSAlBqt
 d3kpSdzbkERherUwK9ZtB/YOQJ8Oy6xw6Lq/zC1Lq8cuo0BXP1gjOUTJb9OvlvGthm
 nI1Vde25LBH0oeNlPuhoefjmusPgaip4mwioS4rmuC/sWCV80avwlRhmCbnNI+tCX5
 udrVEKVYC701OqE3sJg/pPWUMzXjykJxf2RNMP6QsEHY1JRuxcBV1MTjkJCX25sMZn
 tOCU5bfyLyQWg==
Message-ID: <5ff3f8b1-9521-5c7a-7b64-19f61989496c@collabora.com>
Date: Thu, 19 May 2022 10:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: mediatek: add mt8195 svs
 dt-bindings
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20220519060924.13493-1-jia-wei.chang@mediatek.com>
 <20220519060924.13493-4-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519060924.13493-4-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_013457_020786_1AAFB01E 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 19/05/22 08:09, Tim Chang ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Add mt8195 svs compatible in dt-bindings.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
