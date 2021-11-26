Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4b8SshV+FYL9re5oaEr2f8Czn5NQ1eVnhdY1HLw00E=; b=1etAjyTnbS1wuBPmJQW8QLxO9L
	HNAkPt5XMh2ufjYY2RyNQdMmmVPwQlBB7PWWmNWRnh3M01ZJ38+AOgWqtOwU2aepJvpOiHsUqPH/F
	TIqVb/A2+3md2q5Pl6NieVfEqTumYe5Pr+hbe/X5SO/CvAjA/Nx5W6jl6qdc4MFbkp7qIt5pvn78c
	3Xao7af/O28uirszvbTqIwdSbp78E5el6tAwy15VC6T0MwtjNwqU2RaQBo+QVk8KsGVn90tVf+Z9K
	YOVlexbuB58sLWwB1mQc/o4afoVsAaToHvxRNrRp7w9nOwsr6w5b77QztHMWYeEJZKrF9NLBHRgah
	o4EWDFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXuX-009nxg-8v; Fri, 26 Nov 2021 09:52:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXuF-009nrH-M0; Fri, 26 Nov 2021 09:52:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7164A1F4679A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637920354; bh=ZnUEJaaKUjaX1sEaOS2pZbx+Nlz+4IKw336B3gebOgw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aqKDZVo2Y3+c0Tusu4OXJGfNVBhioufcXcm+G+Ehwbg8l40L7DGZfgGPOJatNfGxW
 B98b1uKhzg0XGQ8S+ECcG+Z5wMYpifHc9iSgBHOlL5mZl/FrsrVlTpCWw4A+z1RUXk
 WAYMzZvO5o0O7W/SJCckSr7pdLsPCp9famlYbkTiKmSAWPT+t30z2C7kwANfdp3q2i
 PWIRW4VDCLdiThjsD6agDbl4tOpgdQyKMxedgdCbLjBQ8iqVo3voIe2eu+JiYcWEjv
 uExdfmpdI2UPcXP9UatSOjB0bLK57W2qVqTQOekft51X+NuwS5XsVi5Lr1ND8hhEx0
 nof9ggJyD5ifg==
Subject: Re: [v6 1/5] dt-bindings: power: Add MT8195 power domains
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
 <20211116025045.5401-2-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ad71b562-87aa-2eda-e998-8ae8233e7e3d@collabora.com>
Date: Fri, 26 Nov 2021 10:52:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116025045.5401-2-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015235_954659_D2042C4D 
X-CRM114-Status: UNSURE (   8.71  )
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

Il 16/11/21 03:50, Chun-Jie Chen ha scritto:
> Add power domains dt-bindings for MT8195.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
