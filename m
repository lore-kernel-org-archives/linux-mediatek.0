From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: remove unused array audio_parents
Date: Thu, 30 Aug 2018 18:29:58 -0700
Message-ID: <153567899849.93865.4205043107104480951@swboyd.mtv.corp.google.com>
References: <20180806134402.1055-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806134402.1055-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Colin King (2018-08-06 06:44:02)
> From: Colin Ian King <colin.king@canonical.com>
> =

> Array audio_parents is declared but never used, hence it is redundant
> and can be removed.
> =

> Cleans up clang warning:
> warning: 'audio_parents' defined but not used [-Wunused-const-variable=3D]
> =

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
