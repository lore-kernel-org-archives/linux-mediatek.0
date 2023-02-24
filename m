Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3B9C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6P+NVzYobmMKVjrqrxLKRY9d+F7Ek3zucCPXG74sHY=; b=v0QNX5dRYjbmef9W+6s9K5R8TJ
	JHxLf3SdZfLTfo5o+OYiObf/AO7KMAftbJSkRyp+1kGmf4Atxic8UjdTLdp3x36IXzUv/ZOnTyYj1
	r2DjfW9rabb0gjkACCFYdBGRwGEyC2jRWlOSRX418PKEoMYNuuAabdCNKZwWT6c4ajsQlrEyfDf36
	mp0w3kFsdYeTJFgy//VwzkwPhPh/CE5nkhnl6AeYh8/FrmILJSNh5vF5NBzLW6Ccza4zhxgx2nL7g
	C0ElgbV8HEJenosUXh4PpVShyeebCNqilBDOXJPpk1NB4lfHcadoUGG49QGzWGOuuRzUagGkyJM4b
	fqXzmtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbC6-003Am7-TC; Fri, 24 Feb 2023 16:45:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbC4-003AlI-6W
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 16:45:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E72161939;
	Fri, 24 Feb 2023 16:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E9AC433EF;
	Fri, 24 Feb 2023 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677257111;
	bh=2yTUKRx3XdLapW50dJNmgYDP6iZpEONSnnN1j1EwVsA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VUDxlDhEXSR/CIV9onvNhNdYi2NFqBTalBqDt+S0ZeUcx9+X5ogLsW2B/NvR8esTc
	 1lXwHVXlM0mbYhonGYIYjLUGSIv4iqYVvJRhthBp7Awgb/iwFgl8THhmODcetdSQuh
	 sdRulyLyZSFT7eQAs8XRJNFAEWRXLSLPbbDa+wZKTQFggxTFy1slZfz/hwU4Ln8q4e
	 XAO9JOUoG1pNE3O8ZGvXsaV9j6Q0mFFEG01e83zvrppdZrWSTDeWhI/4I0CD6r8SEW
	 EDivBwS1g8m2N48bkyoMwKM+9CVHceeTjsk35KTP1MASaj/5S8WXYRXUE8paFS5rVt
	 /7dW3+8o4ZHaw==
From: Kalle Valo <kvalo@kernel.org>
To: Howard Hsu <howard-yh.hsu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Ryder Lee <ryder.Lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: mt7915: rework init flow in mt7915_thermal_init()
References: <20230223062457.342-1-howard-yh.hsu@mediatek.com>
Date: Fri, 24 Feb 2023 18:45:07 +0200
In-Reply-To: <20230223062457.342-1-howard-yh.hsu@mediatek.com> (Howard Hsu's
	message of "Thu, 23 Feb 2023 14:24:57 +0800")
Message-ID: <878rgn2ess.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_084512_296631_1126B13A 
X-CRM114-Status: UNSURE (   8.78  )
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

Howard Hsu <howard-yh.hsu@mediatek.com> writes:

> If kernel do not enable CONFIG_HWMON, it may cause thermal
> initialization to be done with temperature value 0 and then can not
> transmit. This commit fixes it by setting trigger/restore temperature
> before checking CONFIG_HWMON.
>
> Fixes: 7d12b38ab6f6 ("wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only after init_work")
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>

Was this supposed to go to v6.3?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

