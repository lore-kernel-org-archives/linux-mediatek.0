Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490D8C79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 05:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=; b=WiK5N1eoPWc3bfZ+KQGVqa/KAq
	eXgYgmQ7LNf8UK1Nvejf2tKHzifKiqCne2rmnJ+zp1dxbyIRXbHUfmXGqyLy/noB2eu4kikCjJ+Xa
	Ehrj1yShCRhzElzGqdOyGAkOZi8OV97O/mPT3rfZpB2ZdfqN0KivDBT+ubQ7G9R1oY96M1/W/FKEQ
	D1AlQfQEkauoSaG4gPZMY78y1ogtYsI4mB2xGdsbOiiEcGcvVEf0+k5CY4Dpv+1KY/Q3K6uURjG8N
	XzsPUoB5zl9TyNyrw4t82vNp0fIo6V2q4Vj+89qT3+hg52qRIDyIG6hWtKt2sQ7aIsmonI84INcwf
	NI6tyP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAj-00000005xYu-1EWS;
	Mon, 07 Sep 2026 05:45:37 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SAg-00000005xWG-2twC
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 05:45:35 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-46adea418f3so1086750fac.1
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2026 22:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759933; x=1789364733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
        b=sa2Van/4is9Qu1EWH5dsEescgN0LleRAYxaFluy0qzm9fgGWXFtatPNMtASUvjj5hc
         rb7v3oY3jMyM+Otheqn5Rysj3sEk6cg+77WKpWN6R2n3n1k8MVyX1l/5jQy2h0wvINdY
         vWJmUBzf08B3n1pJ5jEscGCdCFBblyTJfJhqy4f1SvpBU4EtEdw0Ns4+zrjTt76DvClg
         NZlKXrCa8evH7woyDEQZX7+2SusrwvqZuCVU+kxdUhmwbia735vo3jgrI3VrZOBVTH+h
         YF78XuiXAby1CE0NMUitb8ivxXmqFH2CpMvNK9GOwqeTfUK56PzPwGuoWZcreXYt0RhX
         mOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759933; x=1789364733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o5qbbR1yQ4iI2orK8p1mAk+KPmFDgRJcpOZbeD4+1ts=;
        b=nmys7K6DvIadqCjJ/ydg3+pIqrnroXqbmZRpRyt+DAjf6Arqncyji3TpY9dwCts7ma
         7qqAUucj7tf9puxhvgfk3LAv2IfQHGCFZlDiRA+DiDebC4VN20TmdE1+jTOZ1vB9YZs3
         PBq8dIE9ulT5AuXERgVLHM7oovOvq/aKehP4+05c8FE5oajb6PQJ708c4LVqKMzbhYIi
         4oD4xqaciUp8+SGaMIq9lpEXOyiIzH5oAnI4eHP8Cfnuaq5q+HoY+EAZSeNJJuv9yWj2
         hTJtgmJiKjq8l3booQLxyCLkYO2MIcQgdZ2HDTCfFolElk3VMpuGO9m7oZqBVMrcuMbt
         QCBA==
X-Forwarded-Encrypted: i=1; AKwUvBw08FcPjVQFNNKVik2/Z+phIsVbe4PO8RkP7OQsujNugUVXsIak8xMM0CbHjYn3Rofx9fmFvWi1DmUfg+NQNQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nPPBJwK2Lv78CDkz1UyuzUuAZq7eFMGvTdyoatrJRJ5hnDAxYF
	RRQrJKY6KSNSXJ4fdRj01m4Jr509xufbc1UvpR9jmj/5q10wYp2zy9FQ
X-Gm-Gg: AYBFou3RbLs/yryNJL/IKA2+349oLiabjJNhX6Zon1ZXLZCbdVeRilao4KFqA2DA8XC
	s1o35LmSOIWGm8T7VOsRbfQQvFtIK8ZKDcyxb4aSJfKRoFRD23rIrFuRKLNQzOWNW8CxYHsHW/G
	6jbugEYit3rL23avRj89C6djMCaqIWH9mq1scMPgqroZJW5ePv+R3Ic1Wb4IZA/vM3ZoXQxES7k
	3w4u6M0eHahpGkCn4Q3JO36oLLMJnytYOO+tgLryHVaOtOjrHvfIjoFafiqvlOkX1GY2AKSwUIw
	Dmsyy/UaZ2IcLifjazqgRT4lz4s5DMoLG0O8T0RY2Mm1R1DdxSdMGWEr6OZtJLM7U0DhiAHTDki
	ec2yn445vrvneZhEgQ/lyl7JnzdTHlt5bq9+WzD7AYal7Mn5+3pnajS/FSWcNGU5E/zZTW5X7+q
	77nBLli8tl3xvrMqcGO0vhCMsYT9bBgsdvMfrj6MSpESBnf3xFSJHCuHjKdE9OfA==
X-Received: by 2002:a05:6870:96a3:b0:440:67b1:b59b with SMTP id 586e51a60fabf-4754d5745e0mr13037030fac.0.1788759932942;
        Sun, 06 Sep 2026 22:45:32 -0700 (PDT)
Received: from ryan-dell ([2600:100b:b039:79f4:f7f:ccf7:cd6f:384])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47989a71ebbsm204482fac.17.2026.09.06.22.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:45:31 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 0/2] drm/panel: add Novatek NT51021 1200x1920 DSI panel driver
Date: Mon,  7 Sep 2026 00:45:06 -0500
Message-ID: <20260907054509.118237-1-ryanbrue.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905-rbrue-drm-panel-add-novatek-nt51021-v1-0-939f59e89fc9@gmail.com>
References: <20260905-rbrue-drm-panel-add-novatek-nt51021-v1-0-939f59e89fc9@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_224534_742363_FA9C2BC2 
X-CRM114-Status: GOOD (  10.92  )
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

Please disregard this series.

Nickolay Goppen posted an NT51021 driver a week before my patch, and I
didn't catch it.

https://lore.kernel.org/all/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org/

I checked that there were no patches on the mailing list prior to
working on it, and then forgot to check prior to sending mine. What are
the odds, for an 8+ year old panel? :D

His covers more panels, but my panel seems to be slightly different
from his, based on the vendor kernel I referenced for my bringup. I
tested his driver on my hardware and it works; I'm going to make a
reply on that thread, and I will set up the Amazon Fire HD 10 panel as
a variant on top of his series instead.

Sorry for the noise, I'm new to this and I hope to learn quickly.

Ryan

