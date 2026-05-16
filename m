Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D926CD4851
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2026 19:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/Ooxzr6FEZjkJX+l+du1+RJ2WQpB3zFWntZewkgHGM=; b=vPhALOM1wj+0GSoUaqh1q1HfnA
	uTvq0ZWEMGGvyYEaWiYYQhwlOPRyvUFjjyJdUYrCaGSY+nmZrO9ejSUyg5LwnjYr7I78zDxsxJ7YR
	p5ZCarIJh1IwIp57q5IPp4wqJaZ/Hv5CjmngUUxY+7IsBnguz3TpDTuQ7cALNu4DwDqhXdCjXjgj0
	49TOS6ue+rJdtPGSW4QkLYIJ5w2dCE6AJ8R6m1p0NWczWWNJKGa7Gu5eTkSpataGJmNrQW8NGQ0Wr
	cZ+zSpH+EeAn7BwEE2T5+DKkRCNs3Pn6kJzAiqVtcmqo8OkhOf0VTktijxdbqQlptF2tX3bd5yDgv
	AmbPbmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUG-0000000BLQO-2a2W;
	Sat, 16 May 2026 19:15:48 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUD-0000000BLPM-2eVy
	for linux-mediatek@lists.infradead.org;
	Sat, 16 May 2026 19:15:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44e5624c053so436984f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 16 May 2026 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958944; x=1779563744; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/Ooxzr6FEZjkJX+l+du1+RJ2WQpB3zFWntZewkgHGM=;
        b=cwJF/OlHF6WnM7sKskgNA40LXeHrhawjyJkFaAq6wv1N28MpmToyEPcMPgQw2vTqh3
         V44jilavKl0i4Vc4zLSSR9YU/k7cjEiHDIka65Bxq61RLKLt7DWtHZk8qm5v9HRG1JMZ
         QQ3+BK+EJs/KRdARKcnuBBL0/gIodXoyUhTeCrYZTkPakO4jeVwEb3TxzoRSbGcTJPmd
         PY+KS5lKStuAG+Wngh5CBPqJkDmsVBGSgfduDTKqUKtJ8SHlKZrTB8Lco1N1uWDM+ajO
         BLkTd29Nowmb0R5tfDW2d97AXyyE1TQ8hdbeJYcUVQKOjY+EiGFuh0ZFFQvTszw+ywhu
         /ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958944; x=1779563744;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/Ooxzr6FEZjkJX+l+du1+RJ2WQpB3zFWntZewkgHGM=;
        b=AqXw3OH5gZLo968fxZJbyw3Nz2ljImm81zzIEROFWiFfKnx+GzLt1jcMxMdbb2KeaP
         DprwgEAMdcTXkAqeULH6oDoQubc/vrMJ4PU8yAcnX/m2JEguZAyimLS24Biozr6J4pT7
         Yn7XvucE3Cl7eN3QMHwOMaPD5bsm44qXDPZlwXdLYTOD4l7Cw7Q9aO6UHeRTTIfu7mqX
         Rb081yQc1CKk7XZGb7Bc3fR+XIg/zPX1O4ujFDdBo1YzzJrapQQUe+/9bpdItcv268dN
         LDccLRyk/a0UbBv/6PPeSluDERpwXjdAsjKMfy1cjCDdQEbr0Iy/5II/TM6UbxPXO+Zf
         MANw==
X-Forwarded-Encrypted: i=1; AFNElJ8mBDKm154NX/lWTKdKyw4s2Itr5Z4ecd/SQEUE/LXSZnLT0mU1ulp4AtD6iTgWqG+X9pAXK4m6yfnHWIUz+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YylkpxodM2fEDqI/VW+QyiboP9Yx582vjwc/ehQnBQkNXsgu09U
	MzthOGBnbe5dSLQh8X/WzQftxkICh1VN8iXC1R2QumORDyYh94VnrOE=
X-Gm-Gg: Acq92OEvxZD3kL5MQYxVTKsZxBiS4wnvv1mV9GImCQiU77v8fT4bCYk8Q/OVO7NdMnL
	zdrM8NFlSaPkFS57zBocfpilET5/vMI76223SpCkZzEwBcxMt63qCoNonH8Ix1GYfOoBls7ANqU
	TyOMpYSaajGN6PFUkiTiUzw1ag3uHOX36t+HyszXV3XTxxvNTQQZWYNhDc+h8laq6k96BvkNQWF
	atJuXj3Wrn2tcKvv/G4eCPwS6g6SvK8KjDCBLPyRu3LigNQ+MekgrIB7Eq/xhpRLdJIfT3Fd75M
	SHsa04FdkkYvOJazIw6/EhFJNvPjSDN3tl1O5bQSRdteK01xPHhnctOzSYpzH1+ddOizfDM31kP
	sPEU75BA8GSvkbs9OeX0ORtGR+QWlA6ApnM8gPZfwt1wD33kcmb3cboIgsigE76picg==
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:c3f9 with SMTP id 5b1f17b1804b1-48fe661df4dmr117083015e9.31.1778958943323;
        Sat, 16 May 2026 12:15:43 -0700 (PDT)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm23663118f8f.20.2026.05.16.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:15:42 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: shivamkalra98@zohomail.in
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, luiz.von.dentz@intel.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: btmtk: Fix FUNC_CTRL parsing for devices with
 zero-length payloads
Date: Sat, 16 May 2026 19:15:42 -0000
Message-ID: <177895894204.2999813.16690091301048694150@gmail.com>
In-Reply-To: <20260514-bluetooh-fix-mt7922-v1-1-499c878af1e5@zohomail.in>
References: <20260514-bluetooh-fix-mt7922-v1-1-499c878af1e5@zohomail.in>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_121545_682279_E7D0E579 
X-CRM114-Status: UNSURE (   5.52  )
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

On Thu, 14 May 2026 23:18:13 +0530, Shivam Kalra wrote:
> Fix this by making skb_pull_data() conditional: if the status payload is
> present, parse it as before; if omitted, default to BTMTK_WMT_ON_UNDONE.

Makes sense. The original check was too strict for devices that
legitimately omit the status field on FUNC_CTRL responses.

Reviewed-by: Tristan Madani <tristan@talencesecurity.com>

