Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B25C369CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=; b=YIzH4ZjvStJODh51dkckRpYln7
	2KwuV1e4HYo6PE2kVUiC5fHuNOKZog0cORFkx8K998lok/Za1px+7gS+2rb5a/MwKNFmpMmSZR4Wm
	Ty8wHdYiXAj8j7jpXSpo5qbFHn8wq+rU+ZO8W21WiaUTU4BWULKSmLjiX1fztxbg9OLpT8wTFFqRt
	0AEHCRlHByHMpaFn7gilJaPOsp6oV3U0Nhuumkuew/3cqS2RFZZfP/h9tMEXKyu0v1ARWjAB1Sidh
	TMsCk1H7sUGuflMePHIh0PN7dcmTkrLQnVn5rCLpMPFVeQfu0Cm35kGxbSC3lObdxfeBw5PnEaeLq
	rm7jIZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sjw-0000000Dmf8-3W39;
	Thu, 17 Apr 2025 17:09:28 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUo-0000000Djk7-26x2
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:51 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-601a8b6c133so918564eaf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Apr 2025 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908829; x=1745513629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=;
        b=SVyjgHWqNeYVLlYbFZAhvjA9cvpQGRfJdsSd1ajLJ8Lk2Q7VSanSuV8ZD4pCLtv0MR
         uq0jXCQ6GSFdBoMpOS8crPyjk0QMsxMFq397xmR07CGewVzlO5XUesbT318ct3RnK7zn
         tf7MAeonGjFgCU9H6Znb1Iky2U/axQeAH4FUygZtoJpi7pkuMieB8WnEfTYtn1M6Sh+/
         a+Q+GKKb7p8T05WI6aZcwUI7bJu5bfm3CDV2VzIzNurU04/BsTn5MfKUFdzyYhaVtsmn
         xwIAfa/EPeOIBCSBcRQ/u2NLHpbEDFNkEU6E5yoOeGTj6ZTHOZztY/U3D5WYlN9IPsRS
         IpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908829; x=1745513629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IMlCG6dKgbc70WZaRCp+xgycYGsZNZ1T+JeRrzHG38=;
        b=R53+UfKczW7oyDx6y7OEHappoI1Pb475g/AYpdZkYZ0grgMmd99gacE7fE/J4w4YA0
         YOfWDxI4GsJDeO8Ww79PoqL4dV2iksz5GnyyYDaOPJILSx5TNME0MLhaa2vsjym6C18O
         oUCj9slUBz2GtBauQjtE5AHMD8TK8Iipff1sg8bBsyv5h9BbvlK/0L5zSpN1L2dhrEhR
         6aEuz+4UmwP4B/hIwcth7x0jzax4/A5qS8FJN21+bJeU6TQMXO/xrLWpvyqjreExiwUZ
         0fg6sS75nfvwBbPqUuRWuOpa5dClSsiff69E0wpz0zRuzIHhvKeTZOMnwpNMjqYZATDO
         jq1A==
X-Forwarded-Encrypted: i=1; AJvYcCXnkS3rJwf6dQVgqDeb0qJ0IFhktexmq3y4CHCJ5lGZi98VFlMip6aWyKGmRMJbC1L5fdrpy2XVaiNp7m6LEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNGxIhGV3G6fvQsNiAf6/2JKPW/THfYPIbnp6Nwf/MvUDIJhIV
	fFie8tGmEBn/PZobgulAsEPVx3Ug/R4cdcYleYrkqSz09iFA9tk7cihHFh3yolI=
X-Gm-Gg: ASbGncuivNWA0XLArYANxhi/sW+qQ89BQvNMjC4dWmLPa32Lsck8oDkYDr0GzfvuxBl
	Q1t1fW0d2mEjBWH+v99KNk9u6cICrtI+2hORY1eCWU7COoQHK3UnllIkMhG5l8E3u9bYzoZuP/u
	fD9Y7fFj6IjUY7pn7mWnyPb0bCm/Ho9CEkbQHknctcOD9r+if+Ia5EjYjwA1PuROmLfMXn0zB2m
	RFgzbRBlxJG2p6gUHkSNHFiVUT6KEZuRGmiMugGJftnuo4U9KXG01AFmeJX9l2k5+5ODgit2pBC
	geBj+8UeL4ktU7lr33dVqh6RlQ9Fbpl75fCb1NuSCEknn10=
X-Google-Smtp-Source: AGHT+IHWDVE2JOtKPQU7CbidZGVyB/2fs79a+6FRXoQ5Jm7PUZX3WMp/oUPBswy6Dx17VQWL+Mf4bQ==
X-Received: by 2002:a05:6870:af85:b0:2d4:f247:3675 with SMTP id 586e51a60fabf-2d51d858794mr378775fac.5.1744908829446;
        Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:40 -0500
Subject: [PATCH 8/8] iio: pressure: mprls0025pa: use aligned_s64 for
 timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-8-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dt+1gVnXlBpBf9G5BqjNbQcFysZQg2dzjajvzJ7EGVY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATIHV4NNNWvRCnxHGqKpmu/bY2WH0c2xw0wRI
 MBr9oYxE/SJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEyBwAKCRDCzCAB/wGP
 wJxmB/998v8PSB/5F3IVjQ/L03FccQbQvgcinddv5IhMAvKwG+4u3ZgXoVkpfQEc1Oi/TyFXTry
 D/3jb/fsR53axXk54ddIaElK0Oird/9HbVfsLw0KOvACbrty85JS48EvTq3UCyt9nHyQHCVsd5W
 8TLc1kECCNVsf6x1LB7DxLrQNsd6VvA2FuLb1a5VribVYxR+okowWqAAmjEu3F4CnAGZWvZXljZ
 iQ1hjfWdxslpauWfw7HRAqmVqLoLhxznPLLpFpGysSKe4XAe3wlvC/jYIVlZRMVKlT2fn7r55tV
 o3psJa48e65bIp8T0K9RY7/W/+GEVn6tymZGuZlaKtYyIGFE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095350_549335_7FBE03E2 
X-CRM114-Status: UNSURE (   9.59  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure the struct itself it also 8-byte aligned.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/mprls0025pa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/mprls0025pa.h b/drivers/iio/pressure/mprls0025pa.h
index 9d5c30afa9d69a6a606662aa7906a76347329cef..9fe9eb35e79d992b2a576e5d0af71113c6c47400 100644
--- a/drivers/iio/pressure/mprls0025pa.h
+++ b/drivers/iio/pressure/mprls0025pa.h
@@ -41,7 +41,7 @@ struct mpr_ops;
  */
 struct mpr_chan {
 	s32 pres;
-	s64 ts;
+	aligned_s64 ts;
 };
 
 enum mpr_func_id {

-- 
2.43.0


