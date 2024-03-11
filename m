Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D225CC5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVrQf39TcGT+LrRP/p0MKvKDXKZM5ggz/eiWJSGusAk=; b=jtwL7H7WMq6frS6iBhglSKeRXl
	0SXLm1069c+apOtECTCWgWBr02yx17WpdaVNsei6VFysi/A06nSKHZYaj3T16ufUxbrshbtNAHK89
	MA/sIoY1KMaLvjnZtPHC6oMEhGy1gSDUxhVOlNc9+ZAZWgSlefNhutG3BrDYlQsgls7QTWRg8PHc1
	FcbfqrfrcsOxOhw8dWEZXdU+rErlFO6E3GV/VXUHfRGUzoeGQJ4AKTL7UQVfr++WPsPwQ16yOdO/z
	kEeADuCXPiETTRWyBtuMQlQZ3F5ZLLhVlW0Y6D6Gfgv3ICtpNVURULvzrnHbiwa2jVe3U48A8OCgC
	R7M5tIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjneo-00000003K9p-11Zu;
	Mon, 11 Mar 2024 21:58:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjnel-00000003K8I-1iXc;
	Mon, 11 Mar 2024 21:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75F0860FDA;
	Mon, 11 Mar 2024 21:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DA8C433F1;
	Mon, 11 Mar 2024 21:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710194282;
	bh=mVrQf39TcGT+LrRP/p0MKvKDXKZM5ggz/eiWJSGusAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k54CMSEgi3w6zyiaudhxVRr/v/UMZYF1Z8C/raMDJbP4DIswaMpuwDk8oUQ9PscGA
	 MMHvrHlrwAH28/hhr/Vy2XHAfcssTlV+7AlfATgtU/jllJUGwkVptnvyAkmpwW7tUT
	 WhWT4yE9qdmma+kez/UxHl7JPeGQYFlEGpZu6RBoVNRFuE8TMU1id2I+0ibX6web67
	 YfrRsjVrSlATJWpMB+Ln3MoKmkHQIR64bhldEfaqOQBt6o6ma0MHbvG3pMB/8h+dOC
	 /AjNLmn2KlmcCtfFE5WdK4KCVIJ9XaVoIFsKe3NGKlHd28hAQ3Sj4mXslkkiQK73ME
	 H+DVaoTqHQ+wQ==
Date: Mon, 11 Mar 2024 14:58:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: patchwork-bot+netdevbpf@kernel.org, Justin Swartz
 <justin.swartz@risingedge.co.za>, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
Message-ID: <20240311145800.3840dc27@kernel.org>
In-Reply-To: <2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
	<171019143163.14853.15330891015381229970.git-patchwork-notify@kernel.org>
	<2d206dbb-a27b-4139-a49e-331797d8ba34@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_145803_508962_F8946B36 
X-CRM114-Status: UNSURE (   4.61  )
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

On Tue, 12 Mar 2024 00:22:48 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> Why was this applied? I already explained it did not achieve anything.

Daniel disagreed and you didn't reply to him.

Please don't top post.

