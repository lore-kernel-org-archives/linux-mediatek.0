Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E345C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZTRf7CAQWUe3l/2Ja9uF8uUC2p3lO5LnPdlwehUEnI=; b=EumLt2Z+IKS5Po
	T1dfuAq8nWOJOTLGI4PXlbwxzWxt3IpwECmsj51HSxjdMvOOXmN69tiifyvA4fv7aWsenHKgvyOMw
	X/UZabqZj4fSl2WWC4zWj0QXYgxYOdzqgh87N2JqiGhlnr4NtWsodl2SWk5aBophH+oSlqlWfQ9zk
	WWCTo+MeMgDu0f+luXWi3kLf6K8A28Vy/nSIWVa2d0f6VKjArg3cvksFQS9rveXWQ8S79zpqTR9zG
	D5L6CT8xtCDxVw5dPdzRD1xxS3WogIYFBBkaYmkuvsNAeVbDGQqAoLPe3eXCmhL5fdlaDkwoZgFq1
	9PSsdDF8smRwZpOGgLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYrX-000dJa-F6; Thu, 03 Feb 2022 09:57:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYl9-000a52-SI; Thu, 03 Feb 2022 09:50:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3D8C91F45310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881834;
 bh=bPye+b/gezqZUJB5Cavj0EZwZtjeapMlPkWvsqbKe+Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GToAt42Gm99QQhYwS8QiOER5X25pVLyRPKbhEIINVmKzecffzi7Bouwp6FUJ0SrSj
 GaIKvohXqCbBXXm5/AQiA4QlSaENSyyR+7iMW0MpalPj55XIFi9zIjalot/JtmwEZN
 XcwPwbp0/h0jORcpSbVA/Q8Pe0WeCL2HBrw9rQ/KAMW0UtzUcBOjNOYYfRX+o+SWi2
 oaCBLetw2GZgRRHvZZFcB1Molm9rNDoDLuvI8A1Liba6DMMnd3gRTUinBgxUXoK1x7
 nFxCBvZa8n3Rr3tzmp1Jozhh2mTuX78D5djuCD+dyO3DfmzMF3jExhyqHCq6lk2Fs1
 qIQCGMeG15Znw==
Message-ID: <ef183484-142c-5f74-0483-95e5c9af7992@collabora.com>
Date: Thu, 3 Feb 2022 10:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 13/31] clk: mediatek: pll: Implement unregister API
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-14-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-14-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015036_091319_72AE293D 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> The PLL clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the PLL type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
