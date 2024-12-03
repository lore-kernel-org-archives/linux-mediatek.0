Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E87E64A8C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 13:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Subject:To:Message-ID:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=; b=gZD7xNDT/8i1lEj8+RW6u+zZbU
	+9ZbbkFKpEPEK2nI+yhs6JMKzuzfcH1lAapJlFEZxdUoHBAi03TvcPa4IZmSKi4RQA08+1u0uUL7Q
	9CR02a7ZY4nMwFCcH+e5wBEmyjNhAEQ8Ie7NeMZm5vQh8jz0jl8b/15GCQL2ZjrW5gINl194P3Cx1
	6eCVrF+CKO8DJWv0cZxoCMX0ZHlWM3HK6AaDOWqLBm6s+XBMXCDYFY/MuZWMdZUTttIiqpv+IqG8M
	EW+GSFYfS+8GFPXrK1PcwJlBwIsrebMxGGBGIEDYl4SeZI+NXTev7fWf3nQ+l0pMQ3AsJOTdot70l
	nsYLx1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISm3-00000009a4K-0bHj;
	Tue, 03 Dec 2024 13:17:07 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISch-00000009Y5o-1E5s
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 13:07:28 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so3779854a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2024 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733231245; x=1733836045; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=YFLfORXgVXlIOt80+yQffQfUWDgunsnQGAdenHQGwGp+8cTLg8dJXPXL4dUrIoKTl0
         GtcUjI6V41beb/qC8k02edyTTp4mRxxB5NGFKAnmqyM19Rg3NN5aJCwaMEdLnBbbPthZ
         4layMADX15gnw1q6Ni+9Nt+P354aMgqixnFNstJLkws3c8FXPUvUPrzvApyntIxJ6e5Z
         1ETd1lWrXeQGzZlu8rDqyYU15wkxm3/5uyZmRQ0s4lD9Bjz//HZk6bqH/DB4zDEVThhk
         fU6driRjzOQfuikVXCsbW8fQCrhA0rc9DH2/0I3v6EIiVv9dw8Lsm+es0Z2eJ5fi3fKb
         0Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231245; x=1733836045;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=RsOkmzvoz3h0DCFI+XdYgTGp66aEa0NVoaAOmV52PAag1fdbuzRDpVqX4A6TyyL3mo
         9NH8SdHnACffR6I4vxddKDUXK3wn2PYG1q1yKQZc5V+UtOLY+SkQbh+8fSTLGzd5kAk6
         pl5ECfDbZYPvnDfFq/3FVV+3ZWmfzxzDn6si7TneS8kZ2CufGEtcStw3fe/SntIAYbiH
         rwFtoYFvnydXrBChCOTfGBwLTyG4JQyHxzjpLRrSxngEqOShgYkAD50wcb+u9pJFQ38K
         wTPYbHRbjET1tvO9a64fQuKAv+qsDtlk64eV1yma78Bmp4+mr7PrbTW5red7KvFaoA5J
         sbWw==
X-Gm-Message-State: AOJu0YyJiOVTr4OrVkyKsp+yiSyhwdHdqF1LviEzuXNmGhaTg3tL4w/I
	T34SrSEiSydul6EgVZQYzhtUhGvr9GD5Aqz3v1gVaTV8/yvaB4cjNNUO+0bj
X-Gm-Gg: ASbGncsfj1v0aQJypI3PFhAKMuLZ8VqEjV7zKXbJXQRhR4zL0g8MZE1zL5LXb0wy5dk
	qAfBJnkrx9cz9ls8C1MVe7gV/SOiTWOoldDCJq11S604EjkvE+PYdEIunm3npa5F8HAuUbVs3af
	XRzVrMbBENwRnMi8f0SzdAixgwqcFTpS2Ra6jVMwti6SPcKth/6AVM7/n99ehlNlc32pRAntOcO
	BMO/r8n25huKtBF0R/nLX8t8hdQo5XLwR4qcVmu1QG6Q2qu/J4N8ubax758f/vcXw==
X-Google-Smtp-Source: AGHT+IF47ICZvG4AHFQydn3HGK4RAzRSioj6bD5unxTcdluSqteSsWS8JWFm4lSoo7hoUk+zTRl3Cw==
X-Received: by 2002:a05:6a21:3a96:b0:1e0:c8d9:3382 with SMTP id adf61e73a8af0-1e16542c06amr2519809637.45.1733231245227;
        Tue, 03 Dec 2024 05:07:25 -0800 (PST)
Received: from [103.237.87.171] ([103.237.87.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2e2babsm9539407a12.22.2024.12.03.05.07.24
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:07:24 -0800 (PST)
From: Teri Olson <rtcusvsjmwsbgu@gmail.com>
X-Google-Original-From: Teri Olson <terrolson@hotmail.com>
Message-ID: <7e4eaf3732fa92e9b536ee110f22aab818ee2f251157758cd1e5b2aa667378b0@mx.google.com>
To: linux-mediatek@lists.infradead.org
Subject: ` Piano `
Date: Tue, 03 Dec 2024 20:07:24 +0700
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_050727_321263_EBAC129F 
X-CRM114-Status: UNSURE (   2.32  )
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
Reply-To: terrolson22@outlook.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

I'm giving out my late husband's Yamaha Baby Grand Piano for free to any passionate instrument lover. kindly let me know if you want it or have someone else who wants it.

Thanks,
Teri

