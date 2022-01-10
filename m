Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5AFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVSOVlKPeRqRZ5rFo9xT/C6V8DijgZuu82b7NUbVkkY=; b=Zl7hjRd1TIzogGI9+JoA5sfpYe
	f5pqId7EsxzCxmEK3zgpptW+KxpxLLjkxJ+2TR2y9ltqC6R4z2378s28uwknOU8JdvReV9dLgcFfo
	NsCUWa/Id2fs/ZZGpJDlSqxrdoiwdByZxuYSiY8mznXUgXNJV6l77QOXPibWpR9hyWcV133wy6h82
	B7CUvLiQl3Gob79vjfNoTLe30nbeMeyJ/1YdtXhRWbK+RnuXiW81eXPRZ1qxYW1zeyQ49BcDEsMOB
	pRMaCjz+/rftQh8VaPApTMSypwCTYxCraG2qNjPVDOxqyEZWnUKF7pqO7oVUaQi/6DVt3VqisF0ni
	KPAs8CZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wyB-00CAmJ-Vf; Mon, 10 Jan 2022 15:52:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wwC-00C9Gx-Gw; Mon, 10 Jan 2022 15:50:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B61D41F4331A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829823;
 bh=jYjbYZqGbt7EhiiaCeQztUBOWoiWqy/ulQcO01YneEE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GyGepuYMFEmnWLgVjnu0VxduBNvOP7EOFw+I9mTa7JlvfdYWLDudW+SMTnnkCqmoU
 fXW5JxTi2a9Tcossr4NhulLEDq/ADvDlY4a7PKFi8xYwpi3eebRSnSNQFpPXI8VRqx
 rJQje1vqjfm6LwEPCJvng2oPOvMu2Nq9bn7IrcvJvhKW8el2F7yu1oPDlEj8AANVG9
 De2xqxekk4Vv3CsLx4fwyG85H0l1BlA0WDLhW3y50rz/S8W4XYDNyk55k8hdnCI1xW
 AVlS1wJCH/F7JnD5kI4xEdHwwS8zSx7ZbHrEsZvstq1q2xjdBxZEjVkynJjNeT6uVc
 BCzatk6HqrWRg==
Subject: Re: [v1 08/16] clk: mediatek: Add MT8186 mfgsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-9-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <7781382e-023d-89d2-50a2-37b9711889fe@collabora.com>
Date: Mon, 10 Jan 2022 16:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-9-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_075025_113858_B6701554 
X-CRM114-Status: UNSURE (   8.82  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 mfg clock controller which provides clock gate
> control for GPU.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
