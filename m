Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E3DCA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=; b=g81ke4gxyYIznxt6yxgmfAsAXh
	lYIXC5/0Up0ye77L3xNny2AS6L5iWbtKpPHVBh7Ngi/wSZTSEiEAHLyoATAjYgfXYdB3uC/QUIOqH
	fLvzm0D0Er1cOPNm6v7RzE8LTs7zXEdzZ6nCIAGdq4ZJ/XT7HOatWB6KlfwWFazVobXx8x3GBiwLN
	xGvp1K1fqRdxtqZYc1u5xO9YD3tkCZZBkjeLROQQK7Ez6MDI5zfHS7WHmu8trCC4RP3sKEhbd/KzK
	aNNoJB8JvOjtRGl2U0a9ZtrZxPhXQtvLDeTGXfu9EAQtQUEiW3yY+ALKaeVjtDtKoLOB+RAEFubUQ
	81YMP3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE33T-00000000be7-0zju;
	Tue, 06 Oct 2026 11:09:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE33Q-00000000bd8-3OrC
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 11:09:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e4a341d177so15642035ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 04:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284992; cv=none;
        d=google.com; s=arc-20260327;
        b=TeWfvKKO07levpCro/e/z5nuhKusyLQNO8gDh+KfCGbpgFpLL3p1eaGzWLWxDglGas
         4QfLkhw9uL8dYmwyO4SM/+U07TXfkcFMJySvWicuVYt1J2p2EhGa0Z8o8fssOzmA+AEk
         VX8HIu0c5vN4UxxsJ6+ipAUdrRR9ocZNVOnC3WUw6X3NjAeWu4priTkGG41j/aPLvVbr
         45kgCE6ipknaH+Vdf5BEFmBfU4FFuJBkzdNJ5ENvAIUl3tLZ5w0TS9lZ97O4aUUmeGTT
         XDMHhMlI4RRcAE7CAO9n4SodgrjTu/BTxgX8PtTHLD2glMuN7ye8Eladxoza6ciy9ozT
         3p6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        fh=T1m8yZGwa+1pZ3pMcgHFn7oo1JWrm14hRtaYU2htIek=;
        b=sY+omCwtqnRiT/HQrxv7AqSOt5ajBLh8i7ckHFogt0bYK1S9pApxHA7SUGVsbLvsWE
         8PyFZ9zVubnGSHfwr0yOeFQD5FC6QFVG97jpp7BXLu/egFtQ3lhIbzXNRT3e5yZLeDEr
         PsMtpDEvCy237tk0inGOfNmd5WnUxJA98JiIoGI1+7w592SMcBk5x0byScAftE4yWaHX
         pWxWxjWNKxaTbUNKW3MdsnvlVPBupbJldb4mU5201+3ALLiTwtCAukAVdq5D3kJKdMZL
         BZG3aDc31cdWwLWCkQPezcMT+bxhcRhdjosOOrxmmvwATnbuT6uHerBMqyS7nEIvdLin
         lkyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284992; x=1791889792; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=bXwqp8ch4I0BZ/r0lRjUnH6PaxKe9qN9EdBrAF+Zgl7p4EYwTCVVNJfUgsvvnuIHTn
         0RPjvXWo/Pg3NjbDm+ujbTTTCqV2Cth4gMIM44mO4CYuoKa2Vyy1w2iL3gcRXuPiYWP0
         Pz26BcyLLskJOQwl0P5J2/guEzYSD8iQ5MzFWW3dEkof7P3VYepB04OpsmUUZ+6DmWkI
         aumakyy8D/WFMYUxFuOWfLyG/XYAbY+nSZWdCL/gNVRfXX4r0CJcqtAebP7RCtOcmFOD
         v/3n5huREb+g4tHchGu1YkKpu7iq2WULYnBQqQZYCyAaTyLMCSHAFDsgNXbzmg4W0eC7
         a9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284992; x=1791889792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=ttHjVcd9CisfHrzsYRgp6/mpDBnxqRcBBXCSiMzitA6Dm/ERwbblGYkv6OGJHDpyE7
         BHZgMWHDW9JinE9DGRuqdK6Yho6nZhY9B6roEZxwFQXk5YRwsXpEAWOCLaOe2F4zEouI
         vbJX9VdoAUL2pvi1AOuEp70JBY9hDcfhFGMMD7+KCI5lLTwvkXt6jo/Jq55zGjn8ZApL
         BnFzMCv6Q25Cy3CoqdIN0wgJEs6LdhIrGSTbI03qxLLIO256RddZa436iJp4WK5DTW6Y
         IylCIJWzk8vr00lsVPJtoc1bzIfRQ1fNxqmnW6R07p1IU6R2SiRrj3xmBf3prZwmgQSD
         XTzg==
X-Forwarded-Encrypted: i=1; AKwUvByewqzR44u8AoPX5KXAjczpaCcXl6AaK9e2V4UdfqEfvYk/i4B3ctpOgrc2NRwapVnzQYTgUlFxPKQimt50UQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK6ArkAjmw1CdioSo63Vzkkzh8aJrCWapd5n/1K74MmFJMZ0iZ0
	KAb4pgStomxoTwRjbJ4237eELTPysOsToocrWGFwAlrEKoK4WvFZHdtaTlIM0sVM5GD/Ey88xnZ
	W0Ead9SldlGOeW2ZNDY5PrYe5d2Ov8cY=
X-Gm-Gg: AYBFou0LgBdBKkPcrKnRx42b7mYfppqxrANXdVPtQixKuuYHn7BLB8vBaYYXrhR0jVD
	irIe8B1Kx6xPYstQSMlKTN//uITiDr+OLKcxYw29/NU7suFVeqcRAYc0b58z46aaOOqKn6geNvK
	HswlNaWMa08aHtPEoGzgHXLoW7UwFjTcsZQOzyLif3q6yYXz4/OcFUmkWEb2b7kxujIhkMkMKCH
	6uCaWF9hSq3QtKqQxSTl/1QmTvWaaAuVIsYy17GPt7s1b/i2cgAH6CSOXoJBK1leQNgIGK8oM4Z
	hztpmNi5cjElo7oufljl4uC43Zy23u6Hf2E8kREDGVSCLhgDnSOrn3nAbG8MRGHcl/t8Ama5QvR
	RiDJEvKfrZpr/DuHR9ZBMRs0CMtqORWRqfFnqrsOEnVSDMHC2+H/x+c5a8hawXo5wgnI=
X-Received: by 2002:a17:902:d2ce:b0:2dd:ad74:ac28 with SMTP id
 d9443c01a7336-2e5dcda3da0mr8813935ad.26.1791284991550; Tue, 06 Oct 2026
 04:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-3-phucduc.bui@gmail.com>
 <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
In-Reply-To: <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:09:38 +0700
X-Gm-Features: AclHuK_Pc8LShx91NLSv5hh9JwqBTqHJzVOnbNwPcfyhu5KBMevAfkIzcISxmg8
Message-ID: <CAABR9nEp+-cM921ONe068QQ9OGH5e_+sqTpfBV73xcCCh8uu4g@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from
 mt8188_afe_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_040952_850133_2DFDD957 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi Cezary,

>
> You can reduce the delta by leaving the original if-statement as-is and
> following it up with:
>
>         else
>                 ret = 0;

Thanks, I'll make this change and include it in v2.

Best regards,
Phuc

