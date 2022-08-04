Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6030CC00144
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBmQiOHyKi5uUWG8ZyV6sPBm7XUf4reZ3y0+WQY4v9U=; b=QtpY/gUwjgKVER7JHyJRy7ID+0
	k32onqv2bb0vyuBHTnMZcj5GSi+7Vr+0/HV/n8oTwD1Ikr+yUamZAtawEtEkPwV7Uw+GBwEA6U9a+
	eqrNTTeBBHPgLNpcgX+I0Ks262YiSvfdq2S2LOM+rjkPw3voiiydltLSwcnJyHli2EXD8njG3TnwL
	3hjl/BcHpctClsllB6v602qNv1IEL3IInSSrqJmfGPaRE7SxR1n0Z6VH8d5dIgB2BE6qLczPfSQmO
	Bv0qioNYTNtGsgo43wxNQhKOaV1Wn18JR8UZ0QZSN7uKdGqmjDQJ6w1McJZltCE3QwlVL8+CUWZP+
	4+EO0h4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJU15-003bzi-E2; Thu, 04 Aug 2022 06:07:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJU12-003bx6-Ar
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 06:07:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 07906CE2251;
	Thu,  4 Aug 2022 06:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDBCC433D7;
	Thu,  4 Aug 2022 06:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659593241;
	bh=qD4WESCBpdKVJwtb6NvKw/sL7Gg1CFWcsifaEdp2uUI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=C7Zyh4SBS0UXSRciLF+MHsN57ykfujucy18TAQE8lYrvXsdbQwcylxzbcsM9X04Jv
	 /fTDriYcjqEVz+79SyW9w6xgnkJfi3sWn10lcXmrMYst0v8178GZeTqQTDoqCfTjhx
	 hC4mvLMIgUJWSK2vTpr2sI+ORqUCcvdX6QKIXgFjf5o4aHrsOtsoqjErZXFZ8xu7eE
	 NCrSa+KlevgGi7/fgM/QP5DAaIPGdBYdUhA4xwc63dka8wr4izoFhL34pg2NP11O5Z
	 FDQTeyUAoS+oubTlUGM16dfgUuwJnff1S+MRoi3ZKwp2fxP06hQFP3+d2aEp41DvIN
	 afkFx6lBlLsVw==
From: Kalle Valo <kvalo@kernel.org>
To: <sean.wang@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo.bianconi@redhat.com>,  <Soul.Huang@mediatek.com>,  <YN.Chen@mediatek.com>,  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,  <Deren.Wu@mediatek.com>,  <km.lin@mediatek.com>,  <jenhao.yang@mediatek.com>,  <robin.chiu@mediatek.com>,  <Eddie.Chen@mediatek.com>,  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,  <ted.huang@mediatek.com>,  <Stella.Chang@mediatek.com>,  <Tom.Chou@mediatek.com>,  <steve.lee@mediatek.com>,  <jsiuda@google.com>,  <frankgor@google.com>,  <kuabhs@google.com>,  <druth@google.com>,  <abhishekpandit@google.com>,  <shawnku@google.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: apply the previous MCU timeout
References: <b0dfe8afc5cf88ab9a6d54c88fba4a29631c125a.1659571732.git.objelf@gmail.com>
Date: Thu, 04 Aug 2022 09:07:14 +0300
In-Reply-To: <b0dfe8afc5cf88ab9a6d54c88fba4a29631c125a.1659571732.git.objelf@gmail.com>
	(sean wang's message of "Thu, 4 Aug 2022 08:26:31 +0800")
Message-ID: <87v8r8ilt9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_230728_585312_F9B3911B 
X-CRM114-Status: UNSURE (   8.45  )
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

<sean.wang@mediatek.com> writes:

> From: Sean Wang <sean.wang@mediatek.com>
>
> Apply back the previous MCU timeout that can trigger the chip reset to
> recover the fatal error in time.
>
> Fixes: 8fcd1fb7cbd5 ("mt76: move mt76_connac2_mcu_fill_message in
>  mt76_connac module")

Fixes tag in one line, please.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

