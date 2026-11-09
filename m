Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FD606A333
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N5tPBT5J;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoMy7UZ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=; b=N5tPBT5JNV3VJWLJE2Y7zKLloi
	1c2J8Knwb8dms/nAsGKPt620sVkqYXaUvqJRccRmbFlzYAubexYfWP5vI1WotlNNX3CxZJ+6UgZ3b
	UZBma6oOn3Mcgb+RRBijV03pUYxE7Q3JEXURnA0KpvzirNvQjJuW/KdDpHn4NInM4QPTxOuewBMF+
	ZoCUkR5G7PhjZqf06b6+7KSCXs4Pd1krGbhRFFW8rBlbXm/LoFSEdeRJMEbPd0m/DTt8v4c+aKsYn
	G/Z8VaM6ERVWffVE8w8l5ioOAjtTHVAYji1gD7HPAu/i+NLaOckec1psGcspEr+4ZfVZuvGuPVAcP
	ZT5khDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKSB-000000001qP-3Cgl;
	Mon, 09 Nov 2026 08:10:11 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKS8-000000001pW-3scK
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 08:10:10 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-55e0090c580so196818b6e.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 00:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794211807; cv=none;
        d=google.com; s=arc-20260327;
        b=jLGqSXH6VueY+HYn6piugxcfCANS/27k57a5SLGNHTVYBhV2rslxfdgTNLm33h+7Dj
         pkuttiTUucPi6Ja83wfmdopzaWWRHN4iOuYQNpKxXy310DQwW1Jm/jFy1piSB7mG0dGv
         qVD3TU6NoBuUEx/VT+TXSJRmvZrtujS2tI3D8sMhy/Yf72/qgHikZBsTpqAJhgQsBmPm
         YJAp7aNZqu4lcBY4TQ00LFlj88ZwkVtKBOfAU7HibFP4ETrn5Iqk7dm+BjtkN2xjD86j
         dasJkKjbqSoaEX9SpvSmrAfHIr+9Iu9FY+SKFo80bZ0hjo8zNdSLkxhW/U4xPtwZKJBJ
         bnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
        fh=mKV6ZqpfKu6r2D3OQltmfP7LTQVqwhEHg8ZavsG4Prc=;
        b=O5vAQJiM5+8KWm05VmpujawZh/OCULfB7x0humS6g34A0Pq0nJs121N1Nr8pfV4scD
         +31hnyikVyhnZCOEtYVuvxCDmNXI1TyMyqvsOXcM7Yb1qYudHd4YImsVDAv4jh6UK/J5
         Y7OAz1SUwEr4pkMaK4nSRiDnweU1OtG1+/peldkdM17hd2UxfQqVMzq+SspIEjMxgo4a
         sdz3rSl2h6RN90vMYoXcKbDz4tEsURWk7790WgYtoEVJURRzgf7DDtwtMlFZfVqAQwOm
         qIbUo4v9dlEXr2vnSNkX05/6hyuukFyChpsusBgKDb9CGwbYHp2qb/ZjH2/xtg7bMLMe
         gnRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211807; x=1794816607; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
        b=FoMy7UZ625ZEXsAo9I6U+m4LLnHEZoFtYnogHq6uRpKMQUKcA+UuCdgO7pVeNfOeT0
         7gHCEJ6+j2b5M7rxTK8KmqQkY58ZyddbbWHNFtscPbrjIwWaHIPY6WTpXmrCbRGP2mYo
         0CAhJT4rYJJEeOewohmLRjEYleZKXYltzlND410fTWmKGg2DlXlEjdshNo8mQh+2ETpH
         z6Gr53v5C8ut4KbgeVYLW/RHse4+Oui6vaLcCf15eCFTNtCWa7fs2MPuZuM3HWoirckj
         40kMUPJODNmjgLzdYGIyqEQQ/f6Y2Uryn2kqf6RkZ5GussIHhgXS+0BxSjbO7dq5hNDw
         6hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211807; x=1794816607;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wzZrO5sPMUfvJRQcHJr+J7BND53aW+oD9xw6rkSrV6k=;
        b=SmG5eRysKIIt09/gJTZve5WecFeXxlpdCmgvETaNFLf2XdksNfj06xQGD++zVr0Weu
         GVGuBtGZcq1RPt6eqGTirCePtaI+X4bziW0/YcHxfT2DdH0gDMiNpQ1FbPbY/IyPq3RN
         AHTsA7Ui+7f7BWeIeq47E96urRttQRgzW/Pv27Lqo+Cq9zc832lE/0d2Ce6+no10R8g7
         vhzSEgyx7mZylFH2CAIMcv62byPPH8Q3gB9d80YKEep11W1rEcbkcX1Ux/x/Qa0y6H4x
         PKmQHMrzKQa+RK2EYg07Dq44HITISMhH3rOHGblr6mbjTkbKxmAinf9tok+SrplscP24
         UE9w==
X-Forwarded-Encrypted: i=1; AL+hErEncbQg8wTKYe6msllpnBDGpfJLpUhKILYDyJyuttMzUNwJhfuG+8SZq9ZvvoIti3h0D6DO0UKo6Eg5fsQqEg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+toyruDY1fjAwCRABNYSPpAG5qOkeOt4u3caTtoVjCkKxRsqiN
	7Yhw4znMERwglHvwDv8P3iM2YXV2ICLO4N3F8FSTMCuqlpqlWiFARfAstGj75cGb8Q1ZTEOVX5z
	AqC39oG1Y9siJcG6aAHg+p/tArwbTpYo=
X-Gm-Gg: AYBFou2cYKAl1zyz2eOPYKVZd0ImUDgx7s99kvTVEmZku55PD+WnPxUYVkWhUdBL84J
	Gy36PPinRyjovjJgK6MPDSb0lbQ2pIG4115dO2YakXd6B1awzjNuccTIqatsmxnj9X8SaM9ft1O
	o9oKLXxrREPLV19Yw1pkKynX1THm1V3zA+aqGbUXVSXhVZPo/xlQZU7K6UETOTBWVQY3ChiZ1fZ
	fjZDVtPfbRBbzStqWeD+SzjKUwXwRN9WU2DEc3B7xLO4BO/0eObSCASXOA4UHQCsaJEJyl7ap0G
	Sb19FJNRYApQdwqGuMHkTF0r7hpWqIeInozEdCy1zaoHphHmcwIqxPxGdErme/hMoPInCmEp7aR
	42WXoyENnyr+suMJhzDrwblkxXzczEjnCyrA9bE7TZgUief73Y5fmSyYdimFy/w9kvCqr6w==
X-Received: by 2002:a05:6808:2443:b0:539:df4e:2d20 with SMTP id
 5614622812f47-568146828c6mr1922857b6e.27.1794211807538; Mon, 09 Nov 2026
 00:10:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: YoungJoon Lee <getfeus@gmail.com>
Date: Mon, 9 Nov 2026 17:09:55 +0900
X-Gm-Features: AclHuK90VhaMayepCJ1Mgm4QyzEoe2OcV2WiHEU0AjvSZn4BJkyqHLXO4PcSyLI
Message-ID: <CA+m4KrCF=4KsrN5BfwZ0ycxDPYxfedjLDMtZ4jpLihYShY5rCw@mail.gmail.com>
Subject: MT8173 legacy MDP: PROCESS_ACK status 0 but CAPTURE remains unchanged
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, 
	andrew-ct.chen@mediatek.com
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_001008_968859_F88B8A23 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello, I tested the legacy MT8173 V4L2 MDP path on a Google Elm using
a Linux 7.2.0-next-20260826-based kernel and MT8173 VPU firmware
v1.2.0.

Two one-job tests completed without timeout: saved MT21C 640x384 input
to YUV420M 640x360, and deterministic linear NV12M 640x360 input to
NV12M 640x360 output. In both tests, PROCESS_ACK reported status 0,
the host wait succeeded, and vb2 returned both buffers as DONE. Host
plane-base and allocation-range checks passed. However, every CAPTURE
plane remained byte-for-byte identical to its pre-queue canary. The
linear test did not use decoder output or MT21C.

Is this legacy MDP path expected to work with this kernel/firmware
combination? What should be checked when PROCESS_ACK status is 0 and
buffers are returned DONE, but CAPTURE memory is unchanged? Does this
ACK indicate actual MDP DMA completion, or only successful VPU-side
command handling? Are there MT8173 device-tree, IOMMU, firmware, or
buffer-coherency assumptions that are easy to miss?

The kernel audit patch only records host-side state and does not
change the MDP job path. It cannot show whether firmware actually read
or wrote the buffers. I have not identified a confirmed host-side
defect or established a firmware defect. I can provide the userspace
client, deterministic input generator, logs, and hashes if useful.

Regards,
Youngjoon Lee

