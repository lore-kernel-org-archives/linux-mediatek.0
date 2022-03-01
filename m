Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1TjErMBOuUuumml2RSm7UWvzPfx2tsyhjiSNHWuZDo=; b=g4F8a7ixFDlAJxp4+S8JX4TUcA
	qN4N0JZTGGHmSt+G1R/evB6yXOILScpuVIrns2JaOWW0tyuDF0thuz/ZMm9Wk55pcC8AAOrzRKnji
	xZZPThihcjENQ5BnUFqWwG2tMYlHSDRI4rHFjkqCBl1Urz/Umlq0XiriTIwzh4T+VYKfpIuPqMInb
	tm8Mp7YwpCpUHPNRhK/6Ct5TJT84T1wxVpkAqkIBi2lqaEchNtixiFolUEXjBrPP4n6E3HoTNEUqO
	zQDWLbFIgLFPCml/r4WIDK52lFunI3sOM0PkusVvDyYJzpfS9CkmGQuD6E0Y8FG090cbhA3sN2Vom
	w7xcXFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzDQ-00Fw7X-Sk; Tue, 01 Mar 2022 09:54:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzDD-00Fw4S-By; Tue, 01 Mar 2022 09:54:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 a13-20020a05600c348d00b0038188b8bbf6so830502wmq.0; 
 Tue, 01 Mar 2022 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=Uuqfudvqx8A1r7O6FRl0D0tm/yyoYCBJlkBGNHCef98=;
 b=QbyMlpsQA1iLg4MH7Yrz7E5h4lWt6CBS6hO7GkfwEQnGdwLw7yE7TPRdgH2srDbN2h
 4EDPzd5JPwyq4AK40se0wMu1WZXM7MYjARYEpUvAfns9BV12bisS8xYoL9lJHtYpqhAv
 xdOIgfOKMFbDWEJeKk7rIDd5t1MFs3EHTQvWbLirLaeHqFYbODvss79pe027BWlNgfnr
 Lbx+5NOfS2zFEGP8yFdd7OQ/EgTtQ0jSdZ36qAFDMquTfYiloctcuikPkzACp3GZZZ5B
 HZMdy9vaKMsmeQn2BnQDZrCZvLTDB4Tea5cdkJPvdxoD3nHtGXk7s7Bq01eEHhPZ53Qn
 djqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=Uuqfudvqx8A1r7O6FRl0D0tm/yyoYCBJlkBGNHCef98=;
 b=lOQaHa+1QGKOu0tKpJ47dqmVFq7w69BFUdLBKs+6+S1b0L45s8KNedzm/cqvF1YITY
 QoGGoHjNS9uDomoBfUqc3mQxNTWAQoMRWvWazyuHuSFkroTm9RH6+O50EnFsBN0cWE1B
 5rC81WR5aO+KOzsGG/FprZpVr5wghmfULvh2amnP5BAKl5+1AMKBfxVrY2dFtgE+LRPZ
 XWk1Fx+MYfRj42RnfJwLWc5PpPs5lmjALxzl1QnmPIb6nnqDqeko0OMBLR7c1JhrxS3y
 FyKenooUQmevrmDx7qiBbRiIwtE9irS96F9l0DMkKaLesUkJ+HLyjqU5h0+5yl1CK7Ft
 XGNg==
X-Gm-Message-State: AOAM532A6WqE+tw7IgGy4h/VzoyLY9TudA5d6+jqMaqhLqiY1FgIcRx2
 ZaXLAlfldlGNO5X8SIXY4ctGLUTfpeSbZg==
X-Google-Smtp-Source: ABdhPJxFgSr4iz+YiXmOJ60RzQhJ8hm4ZtrBSwpq9G487MOI13arAtpuNsd41HY811OsZqPGtoxsXA==
X-Received: by 2002:a05:600c:4e4a:b0:380:e40a:289 with SMTP id
 e10-20020a05600c4e4a00b00380e40a0289mr16319445wmq.17.1646128469257; 
 Tue, 01 Mar 2022 01:54:29 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm2630094wmp.44.2022.03.01.01.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:54:28 -0800 (PST)
Message-ID: <9b90b407-025b-ec78-a626-faccdbc7ab39@gmail.com>
Date: Tue, 1 Mar 2022 10:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, John Crispin <john@phrozen.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek updates for v5.18
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_015431_438556_2486FD31 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCBhbmQgT2xvZiwKClBsZWFzZSBoYXZlIGEgbG9vayBvbiB0aGUgYmVsb3cgZGVmY29u
ZmlnIGNoYW5nZXMgZm9yIHY1LjE4LgoKUmVnYXJkcywKTWF0dGhpYXMKCi0tLQpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU3ODMzNjJlYjU0Y2Q5OWIyY2FjOGIzYTlhZWFjOTQy
ZTZmNmFjMDc6CgogICBMaW51eCA1LjE3LXJjMSAoMjAyMi0wMS0yMyAxMDoxMjo1MyArMDIwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWF0dGhpYXMuYmdnL2xpbnV4Lmdp
dC8gCnRhZ3MvdjUuMTctbmV4dC1kZWZjb25maWcKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byBiNWQ4Mzc4ZmYwYmFhNjllNmVlODU3ZGNiNzU0OGMxMGJmMTZkNjRlOgoKICAgQVJNOiBt
dWx0aV92N19kZWZjb25maWc6IEFkZCBzdXBwb3J0IGZvciBBaXJvaGEgRU43NTIzIFNvQyAoMjAy
Mi0wMy0wMSAKMDk6MDg6MzEgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gRW5hYmxlIEFpcm9oYSBTb0Mgb24g
YXJtdjcgY29uZmlnLgotIEVuYWJsZSBDUFUgZnJlcSBmb3IgYXJtNjQgYmFzZWQgU29Dcy4KLSBF
bmFibGUgUE1JQyBiYXNlZCAobXQ2Mzk3KSBSVEMgZm9yIG10ODE3MwoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKb2huIENy
aXNwaW4gKDEpOgogICAgICAgQVJNOiBtdWx0aV92N19kZWZjb25maWc6IEFkZCBzdXBwb3J0IGZv
ciBBaXJvaGEgRU43NTIzIFNvQwoKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDIpOgogICAgICAg
YXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIE1UNjM5NyBSVEMKICAgICAgIGFybTY0OiBkZWZjb25m
aWc6IEVuYWJsZSBjcHVmcmVxIGZvciBNZWRpYVRlawoKICBhcmNoL2FybS9jb25maWdzL211bHRp
X3Y3X2RlZmNvbmZpZyB8IDEgKwogIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgICAgICAg
IHwgMiArKwogIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
