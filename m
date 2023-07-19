Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D69C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6QlzvbD/e2mjrlzWlHYgJ/wX0w9FK+NU3Y2A4ezS80=; b=2/rm8Hn1ydFBT3qlrvLIobjrFs
	e68T6s36Cf3EVzU2uTXe91+RWTzJaKtlZbqCxtfJajhoe3RkVjlHEpZwAyRQNan/C7O05tjliA5Yf
	eR4pxP++WJNxoWqAToOuY7Gj2Rl4VjZaWfvWirbNGTBM0mPdY6nzLfYn9xbQmBaiHLZkZQ8JuY458
	jw6Za+QD2oUAGhIiBLExg3XK6TPv/fsYx49bV7vvE1yy/fVu0eKaBmi6rVddk+qjQLcXP1tYv/YrP
	VsfrAlvcN+UsQxhLOiZGfcBYho5XiAtTgdBvIC4NuhWPynvtiz5aIBtCb1Q4HeTLTAn7XblYuOnh8
	DSopyyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1Md-0063Ab-2l;
	Wed, 19 Jul 2023 07:12:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1Ma-00639J-0N;
	Wed, 19 Jul 2023 07:12:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDE326606F57;
	Wed, 19 Jul 2023 08:12:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689750759;
	bh=pCkN1UkEdv6NF5dWttuNQLaQBHvZEw82zMhYbxwSkEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B/Dm65X43oK5moYNPPU+JxFIGZNxNYErdCvat397MQuVekFNfF5kYx3+aOTM4cV0F
	 1nXnYzKvvlEiwKgUB/n5VFBoO4msXKIY+FDkMR1yzoDZ5Tx4nwkXomkXJpD4Fwi5KC
	 9IQ98/3YigkXk7fMI83YaJdb1n14c0acLyRPislcYF0BjMDfwDK4nxnrITR+yZEalv
	 qxKsUJIYr7/iZLWcfrMm78e7v/lOuIGvChyXpwpW9lkFZiog5aCLJEMKHcv+YBDyF9
	 r1Xq8t0aIeMWqu0T3gKvuEtze0j102tD4KqZD2KeAgiKZxOJzlYnYe+yMsqGazImZ8
	 Rvj0kEWPajpUA==
Message-ID: <72865f80-05bf-0fc1-5941-a12c3d8f8478@collabora.com>
Date: Wed, 19 Jul 2023 09:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: mediatek: Fix "status" values
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230626221005.3946136-1-robh@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626221005.3946136-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_001244_305846_D8839F9B 
X-CRM114-Status: UNSURE (   8.63  )
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

Il 27/06/23 00:10, Rob Herring ha scritto:
> The defined value for "status" is "disabled", not "disable".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



