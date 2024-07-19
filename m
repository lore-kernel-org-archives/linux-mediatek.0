Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB61DC3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 21:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIUIudV3W4EelKHjVdbAz3TupXvxJb8HU8cRrgggIwc=; b=ylTcNf9Ktiv4OdOGdXn5QWv688
	imHfpcMBUGN5Tk95ejG6qFL5zjpWuOBnKp0bRVcVldA108At+IZboFyVH+eCCNLYMZiBW5cujHpWu
	oCfWPMrzz8TZ5tEhTCTw/SvRztT290FsYzwhq0x+6UXR63nHhXXwW2uDHWXFn2iYEpTabWawNkAWI
	Ko6KxQQ+oeoZgr9+88hfjX+sAFV/WlKCXHvJDtI+YbkN6AvI3x4lO+l2pMqYDhd3UwhTp7WkPmjWD
	DUvn8jplyMnVdCgpR1fgQOt/2als4cGO1jCn3b5jHtgk5b6ahb6cctCUcJsyx6tQ5p3XudI7SS3Hj
	zWU+pw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUv7A-00000003pCe-0QWT;
	Fri, 19 Jul 2024 21:26:08 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUv77-00000003pCD-0w83
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jul 2024 21:26:06 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-80a2939265cso77832239f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jul 2024 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721424364; x=1722029164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIUIudV3W4EelKHjVdbAz3TupXvxJb8HU8cRrgggIwc=;
        b=fYu2mn+fWU+I41aUcyIUdvdpqHKajDTzVhjP8KAANJpN04zv26Z45viXIDKccadzA9
         2PkIhpDsD5r8v9xjvz2i0VvPMhc23arqkIB1Xo427pF9HI6W4eNsEe1ehE1Kz0V+eX6+
         CTgW4/tmZo5EiM+9MF69Rlf/vQz0YlK+uWxN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721424364; x=1722029164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIUIudV3W4EelKHjVdbAz3TupXvxJb8HU8cRrgggIwc=;
        b=hyHsSjP9PEZIuIrTP05Q7iGeJeuD6Z6T4DWHkcIgjpU6YxRcZGe7bPvM/rxlU9AYfm
         cC3eRaqpAVT80/FX+dCqZzARQzUAy/j+wK0zvJN7UPpEePC35c4/Qy1+FkNhK7k9Yb9r
         99suh4brX70WL3hyYLcrHaJO9kq2oHxvxkT0kO4RJyLFAf/CwJj9UYhANS13y652Jgf5
         pziWrxZ9uC67haqngMMTaqE+LovXhYJJg7AlYBV91ku/gysR8Cw5dPewVfXHq13CWoSS
         B2Gblw5Rg9eHGv1XNVXL+C4XSYsp0Y8vpQkHCq2uNrxh3gI4EDXzYvFvjuiILax0hVxw
         bPkg==
X-Forwarded-Encrypted: i=1; AJvYcCWmf6i8sTGqxJiGC5CytOnY4MFmHVXiz6g+xlut8pLagPa1B+Tof5UwZ2iZm/hH+Rix01nv81ldNMSL1GGQqkEoMRFNdL159L5BarQVm8NgcMsY
X-Gm-Message-State: AOJu0YzM8S83d2q+iMVhhf2B6CNmh62sZrtSl94A8sbGmn08O49hUQAT
	Gd7uSFjM3Dixp0ZIlnSqSp1y0ADIuluaqpKcbGBbzwDl4a3gMxU8Wv+QjmzB7Q==
X-Google-Smtp-Source: AGHT+IEiTPDsV72AfgDxBbXkqBMrB1vv3zaXpnz+M6Y2UShrsiWah2qsgNBOmPFY5+0G0fmtM4R9tw==
X-Received: by 2002:a05:6602:6c1c:b0:80d:19e4:9d63 with SMTP id ca18e2360f4ac-81aa4dc3a36mr144818839f.3.1721424364015;
        Fri, 19 Jul 2024 14:26:04 -0700 (PDT)
Received: from arowa.c.googlers.com.com (214.62.225.35.bc.googleusercontent.com. [35.225.62.214])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2343ab449sm473825173.113.2024.07.19.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 14:26:03 -0700 (PDT)
From: Arowa Suliman <arowa@chromium.org>
X-Google-Original-From: Arowa Suliman <arowa@chromium.com>
To: mingyen.hsieh@mediatek.com
Cc: Eric-SY.Chang@mediatek.com,
	Leon.Yen@mediatek.com,
	Quan.Zhou@mediatek.com,
	Ryder.Lee@mediatek.com,
	Sean.Wang@mediatek.com,
	Shayne.Chen@mediatek.com,
	Soul.Huang@mediatek.com,
	ch.yeh@mediatek.com,
	deren.wu@mediatek.com,
	km.lin@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	posh.sun@mediatek.com,
	robin.chiu@mediatek.com,
	Arowa Suliman <arowa@chromium.org>
Subject: Re: [v2] wifi: mt76: mt7921: introduce CSA support
Date: Fri, 19 Jul 2024 21:25:48 +0000
Message-ID: <20240719212548.1121903-1-arowa@chromium.com>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
In-Reply-To: <20240530084455.4290-1-mingyen.hsieh@mediatek.com>
References: <20240530084455.4290-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_142605_316150_577CE860 
X-CRM114-Status: UNSURE (   3.91  )
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

Tested-by: Arowa Suliman <arowa@chromium.org>


