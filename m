Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CA0606A319
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 07:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XoMjQvB3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VcUBVqtP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smBeIOz6NkG1jWU580xjUrdeHClJDdyW6/BAJvH47mo=; b=XoMjQvB3UNimUEGezb1zj94feP
	vLlEt8AH9OZtopUmg8DdvM/2+b8clOtGtDUaL8VpQkqLUqkSSPX0/dCEhAKWhcJJT49dDIMDpr7J+
	mahbRw6UIGXVMBfwzpp8IkVO4guL82SLd7TfrSPbHSbrLb/hVW7IOK+yE3GzUc8bJBVGLlVGa/zUP
	3O++8A8wiGgA0ozgtRWvP08JpMVqkOKB1kV7DtVdvn/g85NQGaU30VtIGDwAGXHvqR+emMWWqsoei
	IneZrdOWCplXf6gvpZ3yNhQLtVEedh4S73Un4osmjM75EmzstpGqHjQetaxVT0r2Ennv7stw82XFH
	o6lvGQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnU1-0000000DaaI-0TJN;
	Thu, 22 Oct 2026 07:45:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnTy-0000000DaZQ-22ye
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 07:45:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e10a70540so897585f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655100; x=1793259900; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smBeIOz6NkG1jWU580xjUrdeHClJDdyW6/BAJvH47mo=;
        b=VcUBVqtPtwbW+UuOxcEk3Db0njDh92j17WNmDWh1KwfsiN27sg/ChkdJPcUeSGAcRe
         hK/Z6p8eipCtW7SabwbfrS4ZGVGK4o94U07L87kPqJQcQUh/9ddx9Y6Q85tHA1ABJfGj
         ISBLDBAOGMU7ggJrsxE7E7QhnF0ae/XdOQzD145bkZwfYuYULG+8DUvubwb0UTo/LAcw
         g09oa5fRAl5Xu9zQiTf/S300WoOC8sRqx9sc+uz24zzYVcWwMII/2ZHtBJgm1DhDToRn
         Yr6azXuCj25+PRFhbI2DlPG3pbAaTh03MIsqIyatZLpt1jxe4kKCiGEb/VwYLPbN53kJ
         eUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655100; x=1793259900;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smBeIOz6NkG1jWU580xjUrdeHClJDdyW6/BAJvH47mo=;
        b=FGvmSBSQHv3hlGPf97Q/oKu+DkRb06W8tYjVVCbwgKgQ3xlYEPF/nClbxGIqpTNACR
         bAPYSZH/RUWv+ayvJCN7OvwGkUSv+RV3Z8y63mOnCtKYI7Y3URah5uASR38o3hbGzLfV
         BP9INcf0ajkgRLeygdkm/JcZCkGwtT4CDRtlqdAW4DS3EXkNF5ljIgjX2ucRO1VRCs3+
         nMIFlIfVuTL1kx+fjbCAF4doqUZP2vRKzUbgZ1TfonjLgKufvT0mBgWTtnnxj54+ZwDz
         zcrNJPNThvb1PdMaD2Ls9cUER4cufujHNK6w805GVrMpa91sw53KMFBvXFeDn2CNtAtU
         9HjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBf4joPknDeiP+wKOLWGoQDFi/HiDhG3xY1JgMpt6ymariANrY9k37mMw4dE/fD0hgojlLpBoRK8oiaA7I1g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKsnnloxB8Il0w/+xOA5Ypm0gR+28wNAUJz8EPigkzozv9GMIV1
	ubIBx4kjVlTxmCSsaKcuXicSy/Ue97srWNtv+irnJTu3w6OjCG+5Q77S
X-Gm-Gg: AYBFou3gX/cdgXZYUtQIU0a0rWjjodlaB0wlEPWkAkOq6cGNVakL8gZl+M5N0NRZcAT
	kVxJlhlHExAT9qFrha/c181oMfIRYbBC3B2cAdum2VeHq7qUAvVtMN8yuEnpqlz398LdJuc0HmD
	Ci+HldB3lR9oxsib3Ocnyf8IeYQRDkc/rUbkNPPan33y5AQLBFU4qru+jozyayAZb5KIWOB3oHr
	FVEZmtF7njV3csI4vjhRIWvpQmE4xyAxUrtl+VZlUTQ1YTwk21IzaxEIbGId5IN62tMX7WEbm32
	+Y4R2BzgqwjaNwnhbkxT87LMVm48LiR9Gi1bkQAdorN0ZkPN89KVLFhilWH6R/cfErz1iorzT9S
	lGv5owFHOCPp326iNneC6BHybAKS93iCJnl6g+GAKBj/FKqnpOg3RjmmOjYGZCvK7sjiC8IyJns
	YGxO4beFy0gj8CnLLhMxqRifrhhnl621Zf4mfFcVL+yR4oSBAKWQR5WA2QqGbmB2zDin6kMjoTP
	VJVwG65LBmz6VBJ+WHfRDOuk1E3e45bKHPKWrKvlDVAhFLc03qsrDXVwBE44YRo2/YXnbvKHHJP
	yTVIWvzjEAtExYd95x4gONsFqZTHOj8KnFY=
X-Received: by 2002:a05:6000:420c:b0:48e:888:36b4 with SMTP id ffacd0b85a97d-48e2649d7acmr8838160f8f.9.1792655099919;
        Thu, 22 Oct 2026 00:44:59 -0700 (PDT)
Received: from ubuntu-testserver01.home (80.49.46.208.ipv4.supernova.orange.pl. [80.49.46.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584afe1sm12084605f8f.56.2026.10.22.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:44:59 -0700 (PDT)
From: Viktor Pashaiev <w.paszajew@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Viktor Pashaiev <w.paszajew@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless] wifi: mt76: usb: keep the tx worker parked
 through a reset or teardown
In-Reply-To: <20261021233935.748017-1-lucid_duck@justthetip.ca>
References: <20261021233935.748017-1-lucid_duck@justthetip.ca>
Date: Thu, 22 Oct 2026 09:44:58 +0200
Message-ID: <179265509844.119209.13611344830854882043@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_004502_561339_DA2EADC4 
X-CRM114-Status: UNSURE (   3.61  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Yeah, fixing this inside stop_tx is much cleaner than my disconnect workaroun=
d. Checked the stop_tx call paths across mt76 and the worker state handling t=
hrough reset and teardown - looks solid. Built the modules against 7.3 withou=
t any warnings.

Reviewed-by: Viktor Pashaiev <w.paszajew@gmail.com>

