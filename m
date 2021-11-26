Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1390C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDqN2cVxXd8gkR+F0FYjdFIwugN/6UwKcgFapDSlN1g=; b=BK70lQXzveVqzROKiJp+YavlpL
	OdQo2+r4z51Q8bOr0YlO/dPdXV4ILDPQigpGX1Yp+q5EShFbSZU0gAqsipZGivJxpwkOe/5BZEexv
	XHzFBxPzWPw9DQumFaBJK1nzkI5+EaPn+kY0ZeaCKMtOGC4AUq/ajbz4USpZjkAntv7FdQk2Fqfxx
	wsujKmZHKIGH7quAaRCt6oq1z6rQ8njHAT3l+cssdcwgaVda3Pfk2qbJLjb67uRfGhxI9yjotAuaF
	6gBnPbl34MKyO/wb4vaa2j6X9Uv1LP80sIyvvswgn7U2CkYCvgImabLdlgBlsoZgxegMcwl8q3+k+
	UeMahvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXvC-009oE1-Mv; Fri, 26 Nov 2021 09:53:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXuJ-009nt8-EP; Fri, 26 Nov 2021 09:52:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9EA781F4679E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637920358; bh=LdPocqzS4c6NVM+Baxa36Ld7y/IQX48Z9ZuMAP9HvrM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Wzgy5oin6NcR25FUZZ3ZxFAJmQM2xuX8VDR2OJ1F92bJILJnsTZTM3jJUVfn5GGn+
 vszQpkw4CpY62E755VNz8/n8hQJNlaMbeeeb33BYVvptTVLAFBkcnkgWR1Eow4f0B3
 +tI0//f8Agkimoji60o5oEqv/g2gfovtETC1ZYOCLp5jo1glUVYIclPXS1EPp/So/5
 OgZuiqZDj9le0VgT3QrYt4NmQ5h+Qx3Wy59QcBT9vTLrb5y6d8GKcnUndK8slFla1v
 718A2NkRdbaFRpPAH3DgntP403auZougDHygpnvAc5wjGt5AwWj12E2+TXnp+qD0mg
 ZcBTtlTzRiiIw==
Subject: Re: [v6 4/5] soc: mediatek: pm-domains: Move power status offset to
 power domain data
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
 <20211116025045.5401-5-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ea30ee01-0eb9-31bc-366e-ef5a1a12f969@collabora.com>
Date: Fri, 26 Nov 2021 10:52:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116025045.5401-5-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015239_688531_7F9EBCE2 
X-CRM114-Status: UNSURE (   9.25  )
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
> MT8195 has more than 32 power domains so it needs
> two set of pwr_sta and pwr_sta2nd registers,
> so move the register offset from soc data into power domain data.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
