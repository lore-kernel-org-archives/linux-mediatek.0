Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083BFEB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRpv4Vo3ATK8clUkQJ9MlhXijzabxllJ1GjhPapfYvI=; b=k0DXegXycdrNkjiIZmpEsUfI8K
	z+OEKR4dsA3n3NPyoGque3rM/O8uHfBP35pKORb6Cd87VG/HEN5qZhWjl8+kaufcmwjL1thqxANrY
	9wWYzOrAR4I2dYRglhvcBEtP/FXR4hQdSJjJI7wEmMvX8IHG5QYb2wMKz70Yn7kRYaO2CP8NEOB52
	b5IqewMPy3JQ9j/Bssizkg0CGnT/Exy1ScgM0zqN3gtUuyDgK5T5dNpGb5focC27yGyc9FdRw8lW/
	GOvSLANI/BPup+ewWAhBPRzTlZ9mLPXH8kLgLgiNPatBJTOWhd2j2Td3EgD64sh49DuHi1ceQzNX0
	QyswCRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qExG5-001wLJ-2Q;
	Thu, 29 Jun 2023 19:24:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qExG1-001wJU-2W
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jun 2023 19:24:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF2976162F;
	Thu, 29 Jun 2023 19:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3105C433CD;
	Thu, 29 Jun 2023 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688066683;
	bh=RyiHLlb46KZZE0udKZEWU2kcSiryz9U8Nzhtgw+u4uo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TPF0ha6arWWJ/Q7QMTkxnIgvTFnHS1FYW7MhqFeOEXuO2VLuK3fE7auwXD/Aw5Zx2
	 ZTHASTZvhFaLbwZIFO7EgBD7ZTB97MFCJtXebMzRXtcHnGxzGYZR16B9H+oVtK8OfR
	 vs0mJAE0lJt3wwlh5SS5tKvKvXN8zgGSpdhLATsezaBvLS/JXlYNDec2gDya/V7K5K
	 YN/WEBlCptPDD6GTQOdYh7hrZF2eAKOGZVm+PFNPbGUmBp+B2GMoCCgqsON8LQn57u
	 fgGbtD+FZXhlkEvHxnoux1tCEoDG9OK8PqZZ8aPmdthJhMzRbOr4K+pJAlcxiGp5tY
	 0pra3bOxjmTNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6797C41671;
	Thu, 29 Jun 2023 19:24:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: btmtk: add printing firmware information
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <168806668380.29593.7837994812061217406.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jun 2023 19:24:43 +0000
References: <1c40a12b51ccd6ee2ee002276f5b1ba92c377100.1687990098.git.objelf@gmail.com>
In-Reply-To: <1c40a12b51ccd6ee2ee002276f5b1ba92c377100.1687990098.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 chris.lu@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, jenhao.yang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mmandlik@google.com, abhishekpandit@chromium.org,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_122445_883212_08A59ABA 
X-CRM114-Status: UNSURE (   7.89  )
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 29 Jun 2023 06:20:03 +0800 you wrote:
> From: Chris Lu <chris.lu@mediatek.com>
> 
> Add printing firmware information part when driver loading firmware that
> user can get mediatek bluetooth information.
> 
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: btmtk: add printing firmware information
    https://git.kernel.org/bluetooth/bluetooth-next/c/5ebfb27d09e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



