Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lPv068uzCKAqk5TYVtN9RAUieKsqode4VXcmVIv8v0=; b=tPMwsEoQEFa+qV
	sVH8LEqedmkL4x2ad5eZmBjAwL7sJkTjU1Jd9IJx8KbBLSHyoR84UGSoAXVyXJyOIMIoifaKRk7XB
	ekEXsJm3viwnyDQ7wxkdpd9+zL6ME6K3V/Dm6SQyJa7F1jvI0nRUFoMH5IjaS9MOXdCn0Dvd1V6zd
	d6TdvyjMIp07OalKyxZWpL2BYj6UnQ/Zinxh7ooSasPUnnTHYNOmehe0jtDZhU6g31jlT1qsWUr9p
	u9zcvJk4vrC1BKaVBlcYGf/j4HaEYES2Ftd8xWSAt0mFEQkPV+iV1FtezSy7kKaa3OBvCnW+dra4g
	7+PQTP25CFa+OldZyXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveKU-006UHW-Rj; Mon, 30 May 2022 12:17:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveK8-006UB9-5Z; Mon, 30 May 2022 12:16:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 629D01F42E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653912999;
	bh=9qwTfu2b89QONrY5kLAoHi0RGBsgZ6ra9T4m8UTj+4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FhqQPNLQBOa+iQCv/uO2pdyE7X0sTI6EoUJb6PpYPaA0ihBdc7t1ziqi0r9WF3Ve1
	 y4LVDZMc6HJp9OHRRW43g2x5pNeqkAtATsH0Xu46RCsMPgbnFsG9ISm0/wRXUzvXqq
	 apdNMasqdCjnB8iF3wVnz8rIlZ1vxU9Czme4ULAoKI61Zdv5vWYS2NedEwG4qh2myJ
	 QGwUwCcpPuPE174fm4atpTehxqDTWvnuLAccOx1T3NdAdk+vsv0Co7iXSUmBNKFOpo
	 68YGV/IR8NMBN9ld7RM2WU9sNaCv03iWcJT/EFW9C3/8NM4vyTWMjNc3xA+OGgUL4R
	 bkZFGSBeYFPew==
Message-ID: <7fcf0ac6-ffab-14fb-f4ba-716a3b6ad427@collabora.com>
Date: Mon, 30 May 2022 14:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220527110036.8810-1-johnson.wang@mediatek.com>
 <20220527110036.8810-2-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220527110036.8810-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_051640_387927_1E841EDC 
X-CRM114-Status: UNSURE (   6.88  )
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

Il 27/05/22 13:00, Johnson Wang ha scritto:
> Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
