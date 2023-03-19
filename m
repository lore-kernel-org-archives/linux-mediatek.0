Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E13C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIfSZlQdjq2QeN3yLevVi7u/sy87+Xfos8uz/fqGXZA=; b=Wxn4u9brTSo+5pBLek/xaMm/gR
	6/Tv1QodDaSMXqMStg/6biiEX6cgNLUBPlvvc35kTM+0ep7ZSJODTjnUTdRL42RsBbB++k0DHJJfA
	bC7z6q2VB01aWUo+NtrUYVaEYCo2PBKrMIUuLws6kgh7Z4SKsdtlq55prAS4uQJMtUBuRhFeJYs7z
	uceQPAN2w/dAzoke1cKiWqSDaph4g5++XiSu3NEWShRy+Q/Ur/5SRZ/CP7aQnivP5Ysgvb8xI+hZB
	sFOp6mMf/BZwIyti6So2KHODx92W5gixmuzeWI5pOfeJFVcg+rFdr7/iml9GQbQK6DlvTZ8YwxcaQ
	Wcpgr32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnnB-006Ago-24;
	Sun, 19 Mar 2023 07:49:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnmy-006Ab5-2u;
	Sun, 19 Mar 2023 07:49:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso9423283pjb.2;
        Sun, 19 Mar 2023 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679212152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIfSZlQdjq2QeN3yLevVi7u/sy87+Xfos8uz/fqGXZA=;
        b=pKFQJctjA+4whOxYFNLAtvyVmViSvNOyL7P4Z4SLBqjJEzoX8isS/dLNIFcmw8Falc
         QgD/hLCN7EaFzP/s2MvoTX6//4L7WodJ0WG8lOMJj9VeXXbFMobU/RE8SZoiQ8HKEl2E
         IhvZinW80pe8fUQzHjI+xtov8vpu7o4BuCMcwB+7hx/gx8SrpfxowktCDp1vZ8shCoI7
         NezVaPjgxBOD0M6tlumRMxpO7wIPxIFzKdgoP7q8dgiTW5lzyoJTxzZp+cROPyZJbDAa
         NPyI/fVywoR/QerXqwXoLQdbMmzXVqMLsv4IOSNwJaSyV46T5OZnuV4woiXiZkk4xa5+
         hbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679212152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIfSZlQdjq2QeN3yLevVi7u/sy87+Xfos8uz/fqGXZA=;
        b=PUFS6XT6LWvRGB9YbCETCYMmfhIUFHTIE3pz2F2It945D3EaKa49Wtugt+3mBLWbZQ
         eA2jd3yJSQ+yuuir8j4hiF6wO23ySACwzHcXKmQHhfIsd2nUSJ4m+5KVnEPN7vwkHr94
         yUeJt0dGSfEHD+PHSuVQCopLU330qhwvho0C7CluGJ3gCuctxL4SMuTYJyjzkUl9Lkxz
         Wn18KYnePml/NZuGZbuzNi1U3K0fqK7oqygDqd7Gqkbk7kWCOToBcWW04+EPMPBJIZKd
         E40C4RZ6bdQIHL0XE7PUH3lF2i0OI5fwaHQ3EJgmeaTqKthj0HmFjjkDyh/OqWcbTFMk
         Pxrw==
X-Gm-Message-State: AO0yUKUbmUUXGs5eTdO2CsvAwV9RNmrgf8g5ucAMhlIl1yoV7DIeQEzz
	Ql40ydJU7FSZVIbET5oEKYw=
X-Google-Smtp-Source: AK7set+FBdBMrsQlN6ykWOyiDVcSRVtlF5HFu+P+nP9uLj4Gw+J+D4Y6gqQrJ62tzxJkwQ8h3xkrFw==
X-Received: by 2002:a17:903:300c:b0:1a0:48c6:3b43 with SMTP id o12-20020a170903300c00b001a048c63b43mr11027083pla.37.1679212151985;
        Sun, 19 Mar 2023 00:49:11 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-29.three.co.id. [180.214.233.29])
        by smtp.gmail.com with ESMTPSA id c23-20020a170902849700b001933b4b1a49sm4296638plo.183.2023.03.19.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 00:49:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 501E110667C; Sun, 19 Mar 2023 14:49:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux MediaTek <linux-mediatek@lists.infradead.org>,
	Linux LEDs <linux-leds@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Lee Jones <lee@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/3] Documentation: leds: Add MT6370 doc to the toctree
Date: Sun, 19 Mar 2023 14:49:01 +0700
Message-Id: <20230319074903.13075-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319074903.13075-1-bagasdotme@gmail.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928; i=bagasdotme@gmail.com; h=from:subject; bh=8TeEYL2x7M4VCHkGB1sE6AhLj3kr5Uc9pFr0FLcyZ0M=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCli+/L82pR+MjA/LufiYIwu0hA97ui/pEEg8NTpRp36N Z2zf33sKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwET4zjD8d/GtatU8Ne2gXeWe 9maux9oOb+afc14mstxLVv/9C/+nTQx/+D/kre2M2HLe5ltbR5PL7H1BIqZuy108Ag6n1Sk8ufe fFQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_004912_955909_CBF7E4FE 
X-CRM114-Status: GOOD (  10.23  )
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

Commit 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
adds documentation for Mediatek MT6370 RGB LED device, but forgets to
include it to leds toctree index.

Add the missing entry.

Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/
Fixes: 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/leds/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index b9ca081fac71f4..ce57254cb871f4 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -25,5 +25,6 @@ LEDs
    leds-lp5562
    leds-lp55xx
    leds-mlxcpld
+   leds-mt6370-rgb
    leds-sc27xx
    leds-qcom-lpg
-- 
An old man doll... just what I always wanted! - Clara


