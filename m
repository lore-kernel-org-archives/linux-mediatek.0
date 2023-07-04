Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7505CEB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjwdCg8KpBq49gLHFPpXvTbnUWat4hrdnxVmuaZLIU0=; b=dMYiYlhjcKIprBo+DCoY+fsqx5
	cFIcEmg8iG2RWwlIDt+T24VWMbafo4hAhY3SGwi2tZKxscmS0tXs0TDobmve59heAVG5jZB2QJCwP
	yKDUp56kPe+Aoef3VE7nFFXdiyrZspO9OGu5wK2waeveD5CPgiI6dOmTSqxA6BfQ65qWSrirO4w8z
	stYSCYlric9iAOlDgNdW1IkxFpilI3E0cuW/0ubTch9OQHriQ2gplBmQUwy8g8JND0FDcHflfPNK/
	TLpTIl+N1hqtckFHjBAdTno46DeEHn32MpQO+ljrbM/JoF0TwF+08jIXGKjagWiDSGIxCk3sjyrbB
	g9HGfnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEM-00Cs0N-0p;
	Tue, 04 Jul 2023 10:25:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGdEH-00Crw8-1k;
	Tue, 04 Jul 2023 10:25:54 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3275C6606FA5;
	Tue,  4 Jul 2023 11:25:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688466346;
	bh=n6rTyF0RxNuKHDVLla7lXqv7UEx2T/UfN5pF0e9xwuc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BFwc0qKf9q1h1m3IZcMRwGxB381WBLsJY0cmDCp0WVf74bD0Hs1HHYGktHxNoYwr2
	 6cp0T/CvlLOjvslVPkl1XijvdcMxdYyNSlnSFpYhcy1LlqhriZVam1sflvKzbzW7bC
	 56k6JFWNQtYuQnvdSZZ8zpHFsU1Yp0ucWCpr4SM2ZQJiYWawF5+8ELBjowHcFOrBwS
	 vgV+oVEvYNDiCxR+TBXBWw4HqzA2ostB/QnWNTWQoS2qJgFqEPbVcwhV8NnEKwNivz
	 yumtIjzHJ0RzIbp7EPeT74xdLJueZ5AAhXfUZnZhIXoSJB8QildOgPSkYJa6xf6Hk+
	 Kl/KmpiDWKr/g==
Message-ID: <53e2fa94-6969-fd09-39e5-a354bdbdff66@collabora.com>
Date: Tue, 4 Jul 2023 12:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 2/8] soc: mediatek: pm-domains: Move bools to a flags
 field
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Fabien Parent
 <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230627131040.3418538-1-msp@baylibre.com>
 <20230627131040.3418538-3-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230627131040.3418538-3-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_032553_725158_579B9430 
X-CRM114-Status: UNSURE (   8.01  )
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

Il 27/06/23 15:10, Markus Schneider-Pargmann ha scritto:
> To simplify the macros, use a flags field for simple bools. This is in
> preparation for more flags.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


