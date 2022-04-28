Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA00C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLAOb9ZT9+xNLfrSjsrwHgw7AVlv+/9jgBCExILPNug=; b=cWm98GL8NhNvV3
	9dCgpR6Yp9p1ixuAbUCRkSUtJYMBSIFBVAj87NZ1AGFfyhL7n/xIJ5rXe68sg61oxPxzHS1hO0fP4
	vo9aUgXCyoFsHIy9vUB5eSekwzO4jXIwXYdBC6bMhOghtrdAhOGU2QqBzsZc3Y3ckFh2dY37EWB+l
	WHUyPpQQR3AHAQJ0gD6nQC62u0IHtbttrwE5UkXOeD4yFdUr+Zc8NMGyA7bSRy4BZE5MwBjOS9rWI
	TCY8drqXqnyxh39UWj0W70pKQ191v34bpQR/RuTBYWveheEbpB706ILs482OJ7wA4ehkD6O4hlJpZ
	VLkyh/aN7rmgElpcKA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4Po-0079Ka-NS; Thu, 28 Apr 2022 13:42:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4I5-0075hg-42; Thu, 28 Apr 2022 13:34:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 25E171F4043E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651152877;
 bh=GU8omeXrJMfiZadEv1lU4ULMJLZKc5nKhQvVWYR6Kng=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zci5EGF3w5QPmXuuq1SwposSe9d6KMSH+Ii9J0t8fDkjJ+2m3YGMhkSwg7zkTynOT
 w/Aa2fGUruj+UOOaLFTBHP7XSnhvs+VZnu/ZSce56t3dJYtlEuH4YzuTnuuAU4uiV/
 4v7+SZ41eHXIbheZq9MCva6QLsLleUNuaKmNUPBk5ridkPajUXpjB/SavbfR2aDPYu
 eUMpp4ABATl2qO7Ussp78Jy9en/I6kxjO3Fviszdp2mRb7jpY+rx7G+NrfxApud6Rx
 NrVK166N4mB+o0OPyfdt4yfop/8p1Dyp+ln8isOFls/tXHIqkKSK/Xgpp7mRlgY0gQ
 s4QpN720ZSaKQ==
Message-ID: <8007e692-7a67-2930-709a-494d4e7df1de@collabora.com>
Date: Thu, 28 Apr 2022 15:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: Add compatible for MediaTek
 MT8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 hsinyi@chromium.org
References: <20220428061717.11197-1-allen-kh.cheng@mediatek.com>
 <20220428061717.11197-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428061717.11197-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_063441_387156_77AEAA58 
X-CRM114-Status: UNSURE (   7.09  )
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

Il 28/04/22 08:17, Allen-KH Cheng ha scritto:
> This commit adds dt-binding documentation for the MediaTek MT8186
> reference board.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
