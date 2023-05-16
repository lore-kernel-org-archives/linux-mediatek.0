Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DE2C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 05:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6VaNRlzirablD8AdG0Pvptc712TluU/IVe3G6DPI4w=; b=DFgIQ5F6rMzOM80EjrYrUZXPgy
	zmGWcAzV8/wTl6Agn2Vt7zw7K28cwZ/H4pXxCwtn9tNUc4bZnMXp/ZhzD74/1wpAKlXGHsosr7CyQ
	tNmj+RRFfPdFrB+VvIccSIIlev0G2Dnck5rn1IvrQBZYLyPJv9EB7t10xLAT8bnJ4ag6zislL8Ed0
	CYn+wcQnHwMaDr1PEOunoajqXm7XHnHlmHpqJYDBTXb4A8TQiAXWRk/xNarN0J2e2be5OAkRB6dip
	i57sorQsWl88WUXayXdawY2aRYQEm9IC8duHgjAmy7OdouFz+bmNLh9kiM7Es9z8rV+JLfs2NskE5
	56+6R1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pynAe-004Ph9-1V;
	Tue, 16 May 2023 05:24:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pynAa-004PfJ-0h;
	Tue, 16 May 2023 05:24:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70BB5634B9;
	Tue, 16 May 2023 05:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FC7C43445;
	Tue, 16 May 2023 05:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684214658;
	bh=gBxrbeA0HTMoQOLh6X+GckvCVzQtgJYUiWcNxiQiCHU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GuF1zdvGzQQ6btF1/5DP6jjkyJ98+KzWJWyoLtzMdyXWz00Zq3kmFC1f8u9xEFBwF
	 B26rdTLPlJWdKNkijw+AA8PlaffcqpfBP3Wuv9gOBTdfx0L6TC7fX+IhO26ZsPjU/Z
	 wWiVkUJrQdNbvVorlFB1pmucYUBUZ7hjGomWSgJhc2kQ6hnHspMMu0IIEvVjY7PCyl
	 PdDJWoIr2w0Oj42nTLiSkJZ3QYfdDBNqs7krz3M/HO8/AyNDftFdZYaVawNJTJUkqN
	 VuIhlWo2O9JXH7XC3W8I7dvtf2bqEb8WSODAoKZ3kFqnT+MeGN1AgEi6n9SSko92ZS
	 JsGYs7jpmU1Ag==
From: Kalle Valo <kvalo@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jakub Kicinski <kuba@kernel.org>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt7601u: update firmware path
References: <fefcbf36f13873ae0d97438a0156b87e7e1ae64e.1684191377.git.daniel@makrotopia.org>
Date: Tue, 16 May 2023 08:24:12 +0300
In-Reply-To: <fefcbf36f13873ae0d97438a0156b87e7e1ae64e.1684191377.git.daniel@makrotopia.org>
	(Daniel Golle's message of "Tue, 16 May 2023 00:56:53 +0200")
Message-ID: <87o7mkn91f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_222420_295949_84811279 
X-CRM114-Status: GOOD (  12.40  )
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

Daniel Golle <daniel@makrotopia.org> writes:

> mt7601u.bin was moved to mediatek/ folder in linux-wireless via commit
> 8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")
> and linux-firmware release 20230515.

Why was it moved?

> --- a/drivers/net/wireless/mediatek/mt7601u/usb.h
> +++ b/drivers/net/wireless/mediatek/mt7601u/usb.h
> @@ -8,7 +8,7 @@
>  
>  #include "mt7601u.h"
>  
> -#define MT7601U_FIRMWARE	"mt7601u.bin"
> +#define MT7601U_FIRMWARE	"mediatek/mt7601u.bin"

How do we handle backwards compatibility? We have a rule that old
userspace needs to work with new kernel and this change breaks that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

