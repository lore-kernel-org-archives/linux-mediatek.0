Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E17C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MugKePVe2i/Y5MLYNitql+sjOZYf3x6GQ1nsZOO3g9Y=; b=4A1+EXihsQFHO6
	kIA3PxQ4KVriGXSt1wc4pAVGBR93SOgg07U/N28W10xurwaqFonGWHlHqkVbSKIRebwBjy4zyRvkY
	T6osyhzyz+vnsGTSdBvE1L4Kkk57QKDNtQ/S0SRMhNdfAqYZZjdNxqj+XsdASjVD3GF2Nuu8O9Z06
	mrfm/7f5jO7wRPkIIq7aTYnZbQtv1kd4lOp8jVAVNW2nbe/Vd2es2knLcvy2TBlZJtVrXH8WIOju/
	TXR5pvZiVuK3Z10xlX/yE0T3Fj44uJGeMfr39EJhRD3hBDRCffXW9nVxwGS60Bzxc42oS9/SvniDp
	xWRe0XTE9jwU7S7u+z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Mj-009VoS-Lm; Tue, 15 Mar 2022 14:41:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8MI-009Vem-3K; Tue, 15 Mar 2022 14:41:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 60ADB1F42F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647355269;
 bh=zG3ISQgXBa0GgHMtE7ZUAA2puxpswZTMQYR0Vz+CGO0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CHon2w99Nvf6JpJ6msZQtSMqk41bhHpcNZwCq06IQ7xlZopTIgY3n//bkFFndRivI
 LmAW8v296pfs/G2oS/6xF8HNYs8iAFlMmMPDD7Xj7XX0/N6rInNBU7r21XfqDTQyeX
 yvM0TpG5vzU7f1G/tTgcYkZdPjn/0UFz07z7Z2jlzBB52AGugNwWcrcCtAqhATy8im
 c9Ii1r1vJ8qWyLAK0fSmJpBvqxrrkiOop3uA/5ouj1Z43nkYHmaWG1WhkUOY9MNThP
 29QxYy8JFREO0c9uI9xiY+6QJSf+YMMFHoMChw/TKkaaSjGUcONHMhdBnsL+7TLSOO
 fvICl7jtNBzOA==
Message-ID: <9b2e6f63-e8ef-1427-4677-df654e2e7000@collabora.com>
Date: Tue, 15 Mar 2022 15:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 17/21] arm64: dts: mt8192: Add dpi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-18-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-18-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_074110_307825_75F5E8D3 
X-CRM114-Status: UNSURE (   7.34  )
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

Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> Add dpi node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
