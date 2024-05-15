Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC4C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Odv5quUUpv+qivAhR4+PaZ4RBK2RTXFAfKNTyWmNmNQ=; b=BJZMxZSCcSy1wWg/poHB+XqzRG
	OzPTg7X7EEt3fQ2G0ISxAgMsxHoW1owooUVhgunNTrjGiyvcJhN6hxWbOARkLFPYMk77A3T8rHRZg
	bghVxNI5C3uu/+mBNVjOurATiMm4x7F1QkaZHl/Da4OHwdiGQoQsBWEopdDluXKfet7L0luldOU9+
	NGgJkftFkOg+ApvqtHIHrqOHl8m6k/LWe6sK+6iYdZtuKKylcNu+FsGUzzzJgOEoNuAAhGHugb6mg
	/Tetwf2ZJCRby5DU1LHwmnCbHxJ0IAWXtYfFtg8zNl3IzbDSih3jVdtJ5zhVXhdOHNJS2kx6atiBN
	iFL9lcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s773p-00000000VKy-0Fi2;
	Wed, 15 May 2024 05:20:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s773k-00000000VJQ-3KI7;
	Wed, 15 May 2024 05:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AF0261215;
	Wed, 15 May 2024 05:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D2BC116B1;
	Wed, 15 May 2024 05:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715750406;
	bh=rl/7aOeZVPBm0n8NZhPXRYAk/jsWzpU7OGzVDPRqlds=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ewk9lT/TEQ59ktaWGHajZTJc+lMOMhAHeTr9S3hJHkLc8jA87kL2H96LWeSAxT+gw
	 yfwSh8+4our/Z/0suMrVvBpsjfOKgWTr4pSDfrZW50Ockrl8UKgOiq6utY/vNi1epH
	 BqH4PChiBQF48VzAjFmQZpuMnA6iRJMNZ9WQkpDXH5rZO1E3bFocXWgL0wPuZJk1yD
	 59HfLaxhxVJ0UqnvZf/VQVq5GJBGPwm4wBizeDfH3yfvLCPl2xkb5Nt/FiA7hyQRsu
	 vW4TIl1zt43RypfJClw5HrxnIgRiklNy/6AzZaz2ymH5zk7C/96xW57U/Ct9OGuvEW
	 G9er1t8RjT1TA==
From: Kalle Valo <kvalo@kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-kernel@vger.kernel.org,  linux-wireless@vger.kernel.org,  "Linux
 regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
  linux-mediatek@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Felix Fietkau <nbd@nbd.name>,
  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Peter Chiu <chui-hao.chiu@mediatek.com>,  StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  Johannes Berg <johannes.berg@intel.com>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
References: <6061263.lOV4Wx5bFT@natalenko.name>
	<2341660.ElGaqSPkdT@natalenko.name>
Date: Wed, 15 May 2024 08:20:00 +0300
In-Reply-To: <2341660.ElGaqSPkdT@natalenko.name> (Oleksandr Natalenko's
	message of "Wed, 15 May 2024 00:51:38 +0200")
Message-ID: <87h6ezircv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_222013_106943_A61FC7D5 
X-CRM114-Status: UNSURE (   6.76  )
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

(please don't top post)

Oleksandr Natalenko <oleksandr@natalenko.name> writes:

> Also /cc Johannes because of this commit:
>
> 6092077ad09ce wifi: mac80211: introduce 'channel request'

Have you tried reverting that commit?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

