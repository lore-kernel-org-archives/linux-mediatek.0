Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B153C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 02:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RWiJ8t0XiMLAp749xvo/D5nNonOax/J4OCA0QCWYKPg=; b=m63goTli6Az3GrZe/uSxBuBlIS
	dNw2xxfzBfc+4FmxqOtq9pu5UNKWvE7yqxdGhkgpYu8FE8GVA7k9Acup2OXZlF8uqX5bC/jf2tYxD
	d1RL6Y2ARk/qQVtD6hU+hi7nKrsoXmZdlfv+UX1LAzDv6rV7DgBSudpC/mvSdD9cAVAxRIRIJl3hQ
	qNj32OtVh/nN9290bK1POz6ZvuoMghGSc1+T751Wug6IT8PJwNZQbP7h8tQXvhKF9ZaKb9ycwziO4
	6bJoyuo7UO6ICDhsVq7VM9KBjYkRq3RQge0UTjASW6NzIaap7zpIrXH+UAzOTUYckkfnow36YIZSB
	D2gypsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhbo-004Np6-DT; Fri, 21 Oct 2022 02:18:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olhba-004NkB-4a; Fri, 21 Oct 2022 02:17:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id y4so1055983plb.2;
        Thu, 20 Oct 2022 19:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWiJ8t0XiMLAp749xvo/D5nNonOax/J4OCA0QCWYKPg=;
        b=IEomqwYECzTday/X19gn4iTn2ESEbePwdvwGUqdpq6cdaCnYL+2390UN6fCz+DZ4MO
         XJq39doIV27N1eDpO4pU7FjUjD/fa5mlKjLyuB/8BdkR9AFdB2IXcKf6FCN+gdc175lO
         CDzhzU2mdRnbUahKFkcZtCmOraLq4Dw1O1Q5LxqY01YwIDWlM4ilYb8ixhMkYmV3CCWt
         VyVfwUOgmodOmazNMgZe6HDjVirJxQQgYlXixkcwsVbxps7D2QuH3Li4ExzjYNdOQWjW
         AfMg4PaBAs3bL6f69l/nuj3igv0KyXjGbvXxyU41dWQqnIc5Gbe9pLgcRaMrVjVFA5ME
         00GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWiJ8t0XiMLAp749xvo/D5nNonOax/J4OCA0QCWYKPg=;
        b=z7YMAs8QU49ooBZjaOIWbfYALgWMYZcSk6rl8ZhiIiLVSwqaFwP4J+R0zexFRze9VF
         erLn40WBBPTHG1ofzXK34c2T86ng6ro8CrwYyH7iTmwDhS0H9pnlDW7iPId5txW0SK0Q
         n1WZVrZRnP/tivp0aRaaRlmJWLydlvHp8YG0CEUr/yAxThlaRY/l82C5oLPuf6nGOiVR
         mWQIqcJzXkUiN+I1EwRoLafQ+vh9x0Hqp/+ck+eOL6x/0eIyxq5a0KuCEIETdU4dMGEs
         q3V0WyvmmrB+90fy7PuhdWtiOxCQrS6zws8IKfHfRmPbw5RjphnDAyiTbU7n+RU1ftSQ
         QEUA==
X-Gm-Message-State: ACrzQf1DRdYlKuzrxewrZ+2M+3eJ79veWwjJpIpGeX8R4KbjnbHaDq+4
	UjDMUrdPhfkpMA+0BV04aA5J1OKJLKw=
X-Google-Smtp-Source: AMsMyM7VA6DBUk4v8CWsrLutpzNM9vktotatoow3OtSe49K0ega/rymrJe+ulbth7DHX6vMkOPyAWw==
X-Received: by 2002:a17:90b:1649:b0:20d:2d96:6b05 with SMTP id il9-20020a17090b164900b0020d2d966b05mr55363430pjb.9.1666318667626;
        Thu, 20 Oct 2022 19:17:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:b022:150a:a87e:ab3a:9736])
        by smtp.gmail.com with ESMTPSA id q10-20020a631f4a000000b0045fcfde8263sm12021822pgm.53.2022.10.20.19.17.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Oct 2022 19:17:46 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee@kernel.org,
	matthias.bgg@gmail.com
Cc: chiaen_wu@richtek.com,
	andy.shevchenko@gmail.com,
	cy_huang@richtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the null pointer
Date: Fri, 21 Oct 2022 10:17:41 +0800
Message-Id: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_191750_258661_5DAAB74C 
X-CRM114-Status: GOOD (  12.35  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

This potential risk could happen at regmap_raw_read() or
regmap_raw_write() when accessing the over-bound register address.

For testing, I try to reproduce it with a testing attribute file.
Below's the issue trace log.

[41.314358] pc : i2c_smbus_xfer+0x58/0x120
[41.314371] lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
[41.399677] Call trace:
[41.402153]  i2c_smbus_xfer+0x58/0x120
[41.405956]  i2c_smbus_read_i2c_block_data+0x74/0xc0
[41.410991]  mt6370_regmap_read+0x40/0x60 [mt6370]
[41.415855]  _regmap_raw_read+0xe4/0x278
[41.419834]  regmap_raw_read+0xec/0x240
[41.423721]  rg_bound_show+0xb0/0x120 [mt6370]
[41.428226]  dev_attr_show+0x3c/0x80
[41.431851]  sysfs_kf_seq_show+0xc4/0x150
[41.435916]  kernfs_seq_show+0x48/0x60
[41.439718]  seq_read_iter+0x11c/0x450
[41.443519]  kernfs_fop_read_iter+0x124/0x1c0
[41.447937]  vfs_read+0x1a8/0x288
[41.451296]  ksys_read+0x74/0x100
[41.454654]  __arm64_sys_read+0x24/0x30
[41.458541]  invoke_syscall+0x54/0x118
[41.462344]  el0_svc_common.constprop.4+0x94/0x128
[41.467202]  do_el0_svc+0x3c/0xd0
[41.470562]  el0_svc+0x20/0x60
[41.473658]  el0t_64_sync_handler+0x94/0xb8
[41.477899]  el0t_64_sync+0x15c/0x160
[41.481614] Code: 54000388 f9401262 aa1303e0 52800041 (f9400042)
[41.487793] ---[ end trace 0000000000000000 ]---

Fixes: b2adf788e603 ("mfd: mt6370: Add MediaTek MT6370 support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Dear reviewers:

In v2, I refined the patch title and commit message.

If there's still something improper, please kindly correct me.

---
 drivers/mfd/mt6370.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
index cf19cce..acbf960 100644
--- a/drivers/mfd/mt6370.c
+++ b/drivers/mfd/mt6370.c
@@ -190,6 +190,9 @@ static int mt6370_regmap_read(void *context, const void *reg_buf,
 	bank_idx = u8_buf[0];
 	bank_addr = u8_buf[1];
 
+	if (bank_idx >= MT6370_MAX_I2C)
+		return -EINVAL;
+
 	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
 					    val_size, val_buf);
 	if (ret < 0)
@@ -211,6 +214,9 @@ static int mt6370_regmap_write(void *context, const void *data, size_t count)
 	bank_idx = u8_buf[0];
 	bank_addr = u8_buf[1];
 
+	if (bank_idx >= MT6370_MAX_I2C)
+		return -EINVAL;
+
 	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
 					      len, data + MT6370_MAX_ADDRLEN);
 }
-- 
2.7.4


