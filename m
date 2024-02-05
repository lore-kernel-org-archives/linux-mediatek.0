Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8645CC4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB1bFcwZJs+QDW5dFeb3ndApxspZUYh9atN9MyIulqQ=; b=JmDS2jtQkAZ8EfAfee47TIXbBw
	JZzBrC47k9yv4EDoPinE5yoVRX3zpwVMUOXY4PCNh9qbwPGaHCus/u4nBcAmuU4sbTpDRFF3k8Jru
	69ja6pmEjRb13cXUokvQqo3Gfw5Q033ZxvsqeoDy798/6ggugLznPk4G7mYozmhyp0PQxy1rEbEY/
	0H1CzTJX/GB+aSIDmK1wQ9N3mySWs8HbCF6QjBu5s0EXtkV/FNSVTQk8/hylObFnu2G8o0iSwE5az
	5PmfV39GgHnXfs04ds8nM7VweaxxtHc1XI6B9dKedYEPspYwKCQ0kzWeRYj9aCM5k7M+Ulbve4QLx
	PYS3/dTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuTr-00000002SM6-06oV;
	Mon, 05 Feb 2024 08:37:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuTo-00000002SLX-0Hqb
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Feb 2024 08:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0742CE0C45;
	Mon,  5 Feb 2024 08:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFDDC433C7;
	Mon,  5 Feb 2024 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707122244;
	bh=hK6G4oM70wwT1JwJR2gW0vwH7YkiLydC22reeLWHZuM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=m3Hbhpsx6lWAIIskYed3JtA0efoq9FZuf6aWtayWu2B4Pst+3i1sCegxfHx4V9ktX
	 9G2PsUG85ww6CNI4n9dEvNXs8dGdEJshjJecOy4dnZKyuivEEzh2Lg6rIcvO4uOESz
	 qw49aq+5GXbOr+SZVIzsMo5JVBAq6WJcV8Ol2HodtCejHS6IU2lp0ZIugQM4YByC4D
	 bd48Wwy2FSX2K3EQV6lsOUGNiQSlX7AbgYDloNaZxto0VeH4akupSYKjL9rOqo0e8c
	 q8kH3dw/Ce8EYidgsGjHUiQFXG7Azs3s/0AdsdN6oX6YJpnCrwsSv34/c6ns12FrRc
	 DqWWfdVEJNTbQ==
From: Kalle Valo <kvalo@kernel.org>
To: <sean.wang@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo.bianconi@redhat.com>,
  <Soul.Huang@mediatek.com>,  <Leon.Yen@mediatek.com>,
  <Eric-SY.Chang@mediatek.com>,  <Deren.Wu@mediatek.com>,
  <km.lin@mediatek.com>,  <robin.chiu@mediatek.com>,
  <Eddie.Chen@mediatek.com>,  <jsiuda@google.com>,  <frankgor@google.com>,
  <kuabhs@google.com>,  <druth@google.com>,  <abhishekpandit@google.com>,
  <shawnku@google.com>,  <linux-wireless@vger.kernel.org>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] Bluetooth: btusb: medaitek: fix double free of skb in
 coredump
References: <ca2b3447d110874d90e93c6ddf972f4ad2bc70f9.1706917839.git.objelf@gmail.com>
Date: Mon, 05 Feb 2024 10:37:19 +0200
In-Reply-To: <ca2b3447d110874d90e93c6ddf972f4ad2bc70f9.1706917839.git.objelf@gmail.com>
	(sean wang's message of "Sat, 3 Feb 2024 07:55:27 +0800")
Message-ID: <871q9rb934.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_003728_306924_C3D850AD 
X-CRM114-Status: GOOD (  10.65  )
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
> hci_devcd_append() would free the skb on error so the caller don't
> have to free it again otherwise it would cause the double free of skb.
>
> Fixes: 0b7015132878 ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
> Reported-by : Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

This should be sent to the bluetooth list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

