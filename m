Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9EFC77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 05:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9KKcOWkZxv9F5nb0AoNIcd5rFp5IWlyC4X48M+D4h4=; b=hQ4IFAv8SDpbyg+aKg933PVcxt
	EDV74LGXxMzLj/ZwhzdTyC6kPAL4sEdi6VnHVZ+GN1ruNX3qYOmewYOhb3sJMUypf+2wanxP5Iwwx
	eKEcW2EpiQG+CbA5ZkIngKVDF6zt/tZxwdXxBR2Q3v7eHGBtkbHZ0mEIKrdW8APl5dhBVP6Q3YaVm
	OpvgX/Ho6iH3TfCTM8W88bYc87EUAAXnPbVrZoAE9F9GBhqKEpeZWf2SCH2OpV8cr+bYFI8UAnLwB
	zADeUebfvd/rezry0Nu+xSxzjLFM8T7ZpXpMN++LkLNxGEe29ZevnmoFNb5WR74LChLx2ahioPq+l
	YjCud2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psGGa-008BEW-2q;
	Fri, 28 Apr 2023 05:03:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psGGU-008BDR-1p
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Apr 2023 05:03:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E121E614A8;
	Fri, 28 Apr 2023 05:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F7FC433D2;
	Fri, 28 Apr 2023 05:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682658205;
	bh=KeAjELWR8MQg9MqM1OtAJaVWpO2/4TbzOdm52pKlkq8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nCLGyvI4OOaNgy/CQ2++p2r6avT//Yh9fHaTXLGdNrG059hHwVCZMCz7J6jYudvZo
	 GJiRKrU9B9iDbg7oZqtR6uRkWC7Vi00mkPTpyxEBgaHubmk6X/34v06omt3d2p6RgP
	 JcKTon/eupRUM0f6yKCbd7z3jNW0ELrQcI5KDRFEFeyE1AtmAiSPEtAgpl4v6S4+Ty
	 r0SvCp134W80BUM2oJ+/Ri7xUbP8KHU2crp7CBFacYcdSSnQkCbDNApJLLvP+AiZua
	 xlWPlQvcY4a3HcXlPQhgHfugbLFn3/LODRR9EGYmT0Ko74LLu3pZacQUV+P3GjfwVV
	 8A6LTUDc3k8tw==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7996: fix endianness of MT_TXD6_TX_RATE
References: <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
Date: Fri, 28 Apr 2023 08:03:18 +0300
In-Reply-To: <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Mon, 24 Apr 2023 05:39:05 +0800")
Message-ID: <87r0s4ppih.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_220326_667769_626737B6 
X-CRM114-Status: UNSURE (   8.85  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> To avoid sparse warning:
> sparse: warning: invalid assignment: |=
> sparse:    left side has type restricted __le32
> sparse:    right side has type unsigned lon
>
> Fixes: 15ee62e73705 ("wifi: mt76: mt7996: enable BSS_CHANGED_BASIC_RATES support")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

I guess this is the fix for Jakub's report? I should take it to wireless
then?

What about patch 2, should I also take it to wireless? Felix, ack?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

